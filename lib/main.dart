import 'package:flutter/material.dart';

import 'package:upper/pages/signup/Signup.dart';

Future main() async { //Splash 화면 나타나게 하는 코드!!
  WidgetsFlutterBinding.ensureInitialized(); // 초기화 보장
  await Future.delayed(const Duration(seconds: 3)); // 3초 지연
  runApp(MaterialApp(home: SignupPage(),));
}