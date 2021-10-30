

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shop_app/shared/styles/color.dart';

ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: HexColor('333739'),
    primarySwatch: defaultColor ,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: defaultColor
    ),
    appBarTheme: AppBarTheme(
        titleSpacing: 20.0,
        iconTheme: IconThemeData(color: Colors.white  ),
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: HexColor('333739') ,
          statusBarIconBrightness: Brightness.light ,


        ),
        backgroundColor: HexColor('333739') ,
        elevation: 0.0 ,
        titleTextStyle: TextStyle(
            color: Colors.white ,
            fontWeight: FontWeight.bold ,
            fontSize: 20.0
        )

    ) ,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed ,
      selectedItemColor: Colors.deepOrange ,
      unselectedItemColor: Colors.grey ,
      elevation: 20.0 ,
      backgroundColor: HexColor('333739'),

    ),
    textTheme: TextTheme(
        bodyText1: TextStyle(
            fontWeight: FontWeight.w600 ,
            fontSize: 18.0 ,
            color: Colors.white
        )
    ) ,
  fontFamily: 'jannah'

);


ThemeData lightTheme = ThemeData(
    primarySwatch: defaultColor ,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: defaultColor
    ),
    appBarTheme: AppBarTheme(
        titleSpacing: 20.0,
        iconTheme: IconThemeData(color: Colors.black ),
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,


        ),
        backgroundColor: Colors.white ,
        elevation: 0.0 ,
        titleTextStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold ,
            fontSize: 20.0
        )

    ) ,
    scaffoldBackgroundColor: Colors.white ,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed ,
      selectedItemColor: defaultColor ,
      unselectedItemColor: Colors.grey ,
      elevation: 20.0 ,
      backgroundColor: Colors.white ,


    ) ,

    textTheme: TextTheme(
        bodyText1: TextStyle(
            fontWeight: FontWeight.w600 ,
            fontSize: 18.0 ,
            color: Colors.black
        )
    ),
    fontFamily: 'jannah'


);