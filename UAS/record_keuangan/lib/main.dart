import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:record_keuangan/signIn.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(home: Signinn()));
}
