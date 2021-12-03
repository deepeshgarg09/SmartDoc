class userModel {
  String? uid;
  String? email;
  String? fullName;

  userModel({this.uid, this.email, this.fullName});

  factory userModel.fromMap(map) {
    return userModel(
      uid: map['uid'],
      email: map['email'],
      fullName: map['fullName'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'fullName': fullName,
    };
  }
}
