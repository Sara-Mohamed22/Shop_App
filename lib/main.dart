




import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/shop_app/shop-home-layout.dart';
import 'package:shop_app/modules/shop-App/cubit/cubit.dart';
import 'package:shop_app/network/local/cash_helper.dart';
import 'package:shop_app/network/remote/dio_helper.dart';
import 'package:shop_app/shared/constant.dart';
import 'package:shop_app/shared/styles/themes.dart';

import 'layout/shop_app/home.boarding/on_boarding_screen.dart';
import 'layout/shop_app/login-home/shopLogin_screen.dart';
import 'shared/observer.dart';

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CashHelper.init() ;
  HttpOverrides.global = MyHttpOverrides();

  dynamic onboarding = CashHelper.getData(key: 'onboard') ;


  Widget widget;
  if(onboarding == true )
    {
      print('token : $token');
      if(token != null) widget= ShopLayout();
      else widget = ShopLoginScreen();
    }
  else if( onboarding == false ) {widget= OnBoardingScreen(); }
  else  {widget= OnBoardingScreen(); }

  return runApp( MyApp( startWidget: widget , ));
}

class MyApp extends StatelessWidget {
 final Widget? startWidget ;
  const MyApp({@required this.startWidget }) ;

  @override

  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=> AppCubit()..getHomeData()..getCategoreyData()..getFavorateData()..getProfileData()..getCarts() )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme ,
        darkTheme: darkTheme ,
        home:
            startWidget!
      ),
    );
  }
}



class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}