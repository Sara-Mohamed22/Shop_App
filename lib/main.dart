


import 'package:flutter/material.dart';
import 'package:shop_app/shared/styles/themes.dart';

import 'modules/home.boarding/on_boarding_screen.dart';

void main()
{
  WidgetsFlutterBinding.ensureInitialized();
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme ,
      darkTheme: darkTheme ,
      home: OnBoardingScreen() ,
    );
  }
}
