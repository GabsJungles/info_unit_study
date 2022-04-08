import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:info_unity_study/meu_aplicativo.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    const MeuAplicativo(),
    );
}
