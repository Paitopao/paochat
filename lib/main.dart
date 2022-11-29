import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:paochat/interfaz/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyDE03ksU162g1ql7O_OjYWkz5dVkyHPhq8",
          authDomain: "reto-3-paitochat.firebaseapp.com",
          projectId: "reto-3-paitochat",
          storageBucket: "reto-3-paitochat.appspot.com",
          messagingSenderId: "829947319922",
          appId: "1:829947319922:web:e1b157fcc0ce7c550f14eb",
          measurementId: "G-RFLJW89HMV"));
  runApp(const MyApp());
}
