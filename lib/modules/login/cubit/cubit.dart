
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/models/shop-app/BaseException.dart';
import 'package:shop_app/models/shop-app/login_modal.dart';
import 'package:shop_app/modules/login/cubit/states.dart';
import 'package:shop_app/network/end_points.dart';
import 'package:shop_app/network/remote/dio_helper.dart';

class ShopLoginCubit extends Cubit<ShopLoginState>
{

  LoginModal? LoginData ;

  ShopLoginCubit() : super(ShopLoginInitialState());

  static ShopLoginCubit get(context) => BlocProvider.of(context) ;

  void UserLogin(
  {
      @required String? email ,
      @required String? password
   }
      ) {
    emit(ShopLoginLoadingState());

     DioHelper.postData(
          url: LOGIN ,
          data: {
            'email' : email ,
            'password' : password ,
             }
      )!.then((value) {

        if(value.statusCode ==200)
          {

            print('value');
            print(value.data);
            LoginData = LoginModal.FromJson(value.data) ;

            print(LoginData!.status);
            print(LoginData!.message);
           // print(LoginData!.data!.token);
            emit(ShopLoginSucessState(LoginData));


          }
         else
           {
             throw BaseException.StatusCode(value.statusCode!);
           }

      }).catchError((error)
      {
        print('Error****');
        print(error.toString());
        emit(ShopLoginErrorState(error.toString()));
      });
  }


  bool isHidden =true ;
  Widget visible = Icon(Icons.visibility_outlined);
  bool obscuretext =true ;

  void changevisibiliy()
  {
    if(isHidden) {
      isHidden = false;
      obscuretext = false ;
      visible = Icon(Icons.visibility_off_outlined);

      emit(ShowHidden());
    }
    else {
      visible = Icon(Icons.visibility_outlined);
      isHidden = true;
      obscuretext = true ;
      emit(ShowHidden());
    }
  }


  }

