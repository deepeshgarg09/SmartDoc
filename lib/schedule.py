import collections
from flask import Flask, jsonify, request
from google.cloud import vision
import json
import os
import glob
import io
import pandas as pd
from typing import List, Optional, Union, Tuple, Any, Dict, Type
import numpy as np
import datetime
import werkzeug
import collections

class User(object):
    
    def __init__(self, user_name:str, user_history:Dict = None,
        sleep_hours:Tuple[float] = None, motion_goal:List[Tuple[float]] = None,
        breakfast_time:float=None, lunch_time:float=None, dinner_time:float=None):
        
        self.user_name = user_name
        self.user_history = user_history

        self.sleep_hours = sleep_hours
        self.motion_goal = motion_goal
        
        self.breakfast_time = breakfast_time
        self.lunch_time = lunch_time
        self.dinner_time = dinner_time

credential_path = "assets/poised-gateway-331813-7a4fb7708409.json"
os.environ['GOOGLE_APPLICATION_CREDENTIALS'] = credential_path

ocr = []
final_drugs = []
info = []
ImagePath = ""
global_path = ""
def detect_text(path):
    """Detects text in the file."""
    
    import io
    import sys
    client = vision.ImageAnnotatorClient()

    with io.open(path, 'rb') as image_file:
        content = image_file.read()

    image = vision.Image(content=content)

    response = client.document_text_detection(image=image)
    texts = response.text_annotations
   
    counter = 0
    for text in texts:
        ocr.append(text.description)

    
    if response.error.message:
        raise Exception(
            '{}\nFor more info on error messages, check: '
            'https://cloud.google.com/apis/design/errors'.format(
                response.error.message))
    

def combine_drug_info(info_csv_path,interaction_csv_path):
    info = pd.read_csv(info_csv_path)
    interaction = pd.read_csv(interaction_csv_path)
    interaction_list = []
    for index, row in interaction.iterrows():
        row_dict = row.to_dict()
        interaction_list.append(row_dict)
    info['interaction'] = interaction_list
    return info 

def isNaN(num):
    return num != num

def scheduler(usr,drug_info=None, final_drug = None, time_interval=24.0):
    # initialize
    time_list = np.arange(0,time_interval,0.5)
    schedule = dict.fromkeys(time_list, " ")

    # sleep hours
    sleep_hour = usr.sleep_hours
    sleep_list = [x for x in time_list if x>=sleep_hour[0] or x<sleep_hour[1]]
    for x in sleep_list:
        schedule[x] = 'sleep'

    # meal hours
    meal_list = { 'Breakfast' : usr.breakfast_time, 'Lunch' : usr.lunch_time, 'Dinner' : usr.dinner_time}
    for y, x in meal_list.items():
        if schedule[x] == ' ' :
            schedule[x] = y
        else:
            info.append('Meal conflict with sleep, Please check!')
            print('meal conflict with sleep, please check')
            break

    # motion hours
    motion_hour_list = usr.motion_goal
    motion_list = [x for x in time_list for y in motion_hour_list if x>=y[0] and x<y[1]]
    for x in motion_list:
        if schedule[x] == ' ' :
            schedule[x] = 'Exercise'
        else:
            s = 'Exercise conflict with', schedule[x],', Please check!'
            info.append(s)
            print('exercise conflict with', schedule[x],', please check')
            break

    # fill in prescription
    prescription_list = final_drug
    special_note_output = []
    for drug in prescription_list:
        # get basic info of the drug
        index = list(drug_info['Name']).index(drug)
        dose = drug_info['Dose'][index]
        interval = int(time_interval / drug_info['Interval'][index])
        food = drug_info['Food'][index]
        alcohol = drug_info['Alcohol'][index]
        tobacco = drug_info['Tobacco'][index]
        recom_hours = drug_info['Recommended_hours'][index]
        relat_hours = drug_info['Relative_time_for_meal'][index]
        special_note = drug_info['Special_note'][index]
        

        # special notes
        if not isNaN(special_note):
            special_note_output.append(special_note)
        if alcohol == 0:
            special_note_output.append('Avoid_alcohol')
        if tobacco == 0:
            special_note_output.append('Avoid_tobacco')

        drug_hour_list = []
        # recommend hour first
        if not isNaN(recom_hours):
            recom_hours = tuple(recom_hours[1:-1].split(","))
            #print(recom_hours)
            drug_hour_list = [x for x in time_list if x>=int(recom_hours[0]) and x<=int(recom_hours[1])]
            drug_hour_list = [x for x in drug_hour_list if schedule[x]==' ' or schedule[x]=='Breakfast' or schedule[x]=='Lunch' or schedule[x]=='Dinner']
        else:
            drug_hour_list = [x for x in schedule.keys() if schedule[x]==' ' or schedule[x]=='Breakfast' or schedule[x]=='Lunch' or schedule[x]=='Dinner']

        # consider meals
        if food == 1:
            drug_hour_list = [x for x in drug_hour_list if schedule[x]=='Breakfast' or schedule[x]=='Lunch' or schedule[x]=='Dinner']


        # relative time of meals
        if not isNaN(relat_hours):
            relat_hours_list = [x for x in schedule.keys() for y in meal_list.values() if abs(x-y)<float(relat_hours)]
            drug_hour_list = [y for y in drug_hour_list if y not in relat_hours_list]

        # interactions
        interactions = drug_info['interaction'][index]
        import ast
        interactions = ast.literal_eval(interactions)
        for other_drug in prescription_list:
            if other_drug==drug:
                continue
            severity = interactions[other_drug]
            if severity>0:
                times = [time for time,act in schedule.items() if other_drug in act]
                if len(times)>0:
                    conflict_time_list = [x for x in schedule.keys() for y in times if abs(x-y)<severity]
                    print('conflict_time_list',conflict_time_list)
                    drug_hour_list = [x for x in drug_hour_list if x not in conflict_time_list]

        #print(len(drug_hour_list),interval,drug_hour_list)
        if len(drug_hour_list)<interval:
            info.append('Strict prescription conflict, please check with the doctor!')
            print('Strict prescription conflict, please check with the doctor')
            break
        else:
            # finalize the schedule
            drug_takes = [] #random.sample(drug_hour_list, interval)
            for i in range(interval):
                one_take = drug_hour_list[i]
                drug_takes.append(one_take)
                drug_hour_list = [x for x in drug_hour_list if abs(x-one_take)>1.5]

            for x in drug_takes:
                if schedule[x] == 'Breakfast' or schedule[x]=='Lunch' or schedule[x]=='Dinner':
                    schedule[x] = schedule[x] + ', ' + drug + ', ' + str(dose) + ' pill(s)'
                else:
                    schedule[x] = drug + ', ' + str(dose) + ' pill(s)'

    return schedule

def timeFloat(c, d) :
    a = datetime.time(c, d, 0, 0)
    return 0.5*round((a.hour+a.minute/60.0)/0.5)

def floatTime(time) :
    result = '{0:02.0f}:{1:02.0f}'.format(*divmod(time * 60, 60))
    return result

response = {}
idx = 0

app = Flask(__name__)

@app.route('/schedule', methods = ['GET', 'POST'] )
def schedule() :
    global response


    usr = User("User")

    
    request_data = request.data
    request_data = json.loads(request_data.decode('utf-8'))
    bed1 = int(request_data['bed'][:2])
    bed2 = int(request_data['bed'][3:])

    bed = timeFloat(bed1, bed2)

    wake1 = int(request_data['wake'][:2])
    wake2 = int(request_data['wake'][3:])

    wake = timeFloat(wake1, wake2)

    breakfast1 = int(request_data['breakfast'][:2])
    breakfast2 = int(request_data['breakfast'][3:])

    breakfast = timeFloat(breakfast1, breakfast2)

    lunch1 = int(request_data['lunch'][:2])
    lunch2 = int(request_data['lunch'][3:])

    lunch = timeFloat(lunch1, lunch2)

    dinner1 = int(request_data['dinner'][:2])
    dinner2 = int(request_data['dinner'][3:])

    dinner = timeFloat(dinner1, dinner2)

    exStart1 = int(request_data['exStart'][:2])
    exStart2 = int(request_data['exStart'][3:])

    exStart = timeFloat(exStart1, exStart2)

    exEnd1 = int(request_data['exEnd'][:2])
    exEnd2 = int(request_data['exEnd'][3:])

    exEnd = timeFloat(exEnd1, exEnd2)

    
    
    df = pd.read_csv("assets/drug_info.csv")
    rows = len(df.index)
    drugs = []

    for row in range(rows) :
       drugs.append(df['Name'][row])
    
    final_drugs = list(set(drugs) & set(ocr))
    print('Final Drugs: ', final_drugs)

    usr.sleep_hours = (bed, wake)
    usr.motion_goal =[(exStart, exEnd)]
    usr.breakfast_time = breakfast
    usr.lunch_time = lunch
    usr.dinner_time = dinner
    usr.user_history = {'prescription' : final_drugs}
    
    all_drugs = pd.read_csv("assets/all_drugs.csv")
    array = {}

    
    ans = scheduler(usr, all_drugs, final_drugs)
    print(ans)

    for drug in final_drugs :
        for a, b in ans.items() :
            if(drug in b):
                array[a] = b
                
    idx = 0
    for a, b in ans.items() :
        if(b == 'Exercise' and idx == 0) :
            array[a] = b
            idx = idx + 1
        if(b == 'Breakfast') :
            if(a not in array.keys()) :
                array[a] = b    
        if(b == 'Lunch') :
            if(a not in array  ) :
                array[a] = b
        if(b == 'Dinner') :
            if(a not in array ) :
                array[a] = b
            
    
    array = collections.OrderedDict(sorted(array.items()))

    final_array = {}

    for k, v in array.items() :
        s = floatTime(k)
        final_array[s] = v
    l = 1
    for k in info :

       final_array['Info' + ' ' + str(l) ] = str(k)
       l = l + 1
  
    
    print(final_array)
    info.clear()
    ocr.clear()
    return(jsonify(final_array))    

@app.route('/upload', methods = ['GET', 'POST'] )
def upload() :
    imageFile = request.files['image']
    fileName = werkzeug.utils.secure_filename(imageFile.filename)
    imageFile.save("assets/" + fileName)
    ImagePath = fileName

    global_path = "assets/" + ImagePath
    detect_text(global_path)
    print("OCR :", ocr)
    return jsonify({
        "message" : "Image Uploaded Successfully!"
    })

    
if __name__ == '__main__' :
    

    app.run(host='0.0.0.0', debug=True)    

