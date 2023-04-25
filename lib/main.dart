// import
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:EASY_HOUSE_FINDER/application.dart';
import 'package:EASY_HOUSE_FINDER/firebase_options.dart';

// system input
void main() async {
  runApp(const Application());
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}
