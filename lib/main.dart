import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:info_unity_study/meu_aplicativo.dart';
import 'package:info_unity_study/services/auth_service.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthService()),
      ],
      child: MeuAplicativo(),
    ),
  );
}
