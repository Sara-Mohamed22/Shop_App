
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/models/shop-app/BaseException.dart';
import 'package:shop_app/models/shop-app/login_modal.dart';
import 'package:shop_app/modules/register/cubit/register_state.dart';
import 'package:shop_app/network/end_points.dart';
import 'package:shop_app/network/remote/dio_helper.dart';


class ShopRegisterCubit extends Cubit<ShopRegisterState>
{

  LoginModal? LoginData ;

  ShopRegisterCubit() : super(ShopRegisterInitialState());

  static ShopRegisterCubit get(context) => BlocProvider.of(context) ;

  void UserRegister(
      {
        @required String? email ,
        @required String? password ,
        @required String? name ,
        @required String? phone
      }
      ) {
    emit(ShopRegisterLoadingState());

    DioHelper.postData(
        url: REGISTER,
        data: {
          'email' : email ,
          'password' : password ,
          'name' : name ,
          'phone' : phone
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
        emit(ShopRegisterSucessState(LoginData));


      }
      else
      {
        throw BaseException.StatusCode(value.statusCode!);
      }

    }).catchError((error)
    {
      print('Error****');
      print(error.toString());
      emit(ShopRegisterErrorState(error.toString()));
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

