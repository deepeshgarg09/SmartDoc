import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

class Utils {
  static StreamTransformer<QuerySnapshot<Map<String, dynamic>>, List<T>>
      transformer<T>(T Function(Map<String, dynamic> json) fromJson) =>
          StreamTransformer<QuerySnapshot<Map<String, dynamic>>,
              List<T>>.fromHandlers(
            handleData: (QuerySnapshot data, EventSink<List<T>> sink) {
              final snaps = data.docs.map((doc) => doc.data()).toList();
              final users = snaps
                  .map((json) => fromJson(json as Map<String, dynamic>))
                  .toList();

              sink.add(users);
            },
          );

  static Timestamp? toDateTime(Timestamp? value) {
    if (value == null) return null;

    return value;
  }

  static dynamic fromDateTimeToJson(Timestamp? date) {
    if (date == null) return null;

    return date.toDate();
  }
}
