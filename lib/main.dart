import 'package:flutter/material.dart';
import 'package:read_diary/injection_container.dart';
import 'package:read_diary/read_diary.dart';

Future<void> main() async{
  await initializeDependencies();
  runApp(const MyApp());
}


