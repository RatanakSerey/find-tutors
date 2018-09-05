import 'dart:async';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';

Future firebaseConfig() async {
  final FirebaseApp app = await FirebaseApp.configure(
    name: 'test',
    options: new FirebaseOptions(
      googleAppID:
          Platform.isIOS ? '' : '1:1050676976358:android:d5ef913016960d3e',
      gcmSenderID: '1050676976358',
      apiKey: 'AIzaSyAfSJL8-eabWevwEgqvuA9EnKctHHucYnc',
      projectID: 'find-tutors',
    ),
  );
  final FirebaseStorage storage = new FirebaseStorage(
      app: app, storageBucket: 'gs://find-tutors.appspot.com');
  return storage;
}
