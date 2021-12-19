
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/shop_app/shop-home-layout.dart';
import 'package:shop_app/models/shop-app/BaseException.dart';
import 'package:shop_app/models/shop-app/category-model.dart';
import 'package:shop_app/models/shop-app/favorite_model.dart';
import 'package:shop_app/models/shop-app/getFavorite_modal.dart';
import 'package:shop_app/models/shop-app/home_model.dart';
import 'package:shop_app/models/shop-app/Login_modal.dart';
import 'package:shop_app/modules/category/category.dart';
import 'package:shop_app/modules/favoriate/favoriate.dart';
import 'package:shop_app/modules/products/product-screen.dart';
import 'package:shop_app/modules/settings/settings.dart';
import 'package:shop_app/modules/shop-App/cubit/states.dart';
import 'package:shop_app/network/end_points.dart';
import 'package:shop_app/network/remote/dio_helper.dart';
import 'package:shop_app/shared/constant.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppStateInitialize());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  HomeModel? homemodel;
  CategoryModal? categorymodel ;

  List<Widget> screens = [
    ProductScreen(),
    CategoryScreen(),
    FavoriateScreen(),
    SettingsScreen()
  ];


  changeNavigationBar(int index) {
    currentIndex = index;
    emit(BottomNavBarState());
  }

  Map<int , bool>favoriates ={} ;

  getHomeData() {
    emit(AppLoadingState());

    DioHelper.getData(url: HOME, token: token)!.then((value) {
      if (value.statusCode == 200) {
      //  print(value.data);
        homemodel = HomeModel.FromJson(value.data);
        // print(homemodel!.data!.banners![0].image);
        // print(homemodel!.data!.products![0].name);
        // print(homemodel?.status);
        // print(homemodel!.data!.products![0].images!.length);
          homemodel!.data!.products!.forEach((element) {
            favoriates.addAll({
              element.id! : element.inFavorites!
            });
          });

          print(favoriates.toString());

        emit(AppSuccessfulState());
      }
      else {
        throw BaseException.StatusCode(value.statusCode!);
      }
    }).catchError((e) {
      print('errorrrrr ::');
      print(e.toString());
      emit(AppErrorState(e));
    });
  }

/*  bool fav = false;
  IconData unfavoriate = Icons.favorite_border ;


  addToFavoriate(int index  ) {
    fav = !fav;
    print('fav $fav');

        fav
            ? unfavoriate =
          Icons.favorite,

            : unfavoriate =
          Icons.favorite_border,


        emit(AppFavoriteState());

      }*/


      getCategoreyData()
      {
        print('category');
        DioHelper.getData(url: CATEGORIES ,token: token )!.then((value) {
        //  print(value.data);
          if(value.statusCode ==200)
            {
            //  print('category : ${value.data}');
              categorymodel =CategoryModal.FromJson(value.data);
           //   print(categorymodel?.data!.data![0].name);

              emit(AppCategorySuccessfulState());
            }
          else
            {
             throw BaseException.StatusCode(value.statusCode!);
            }

        }).catchError((e){
          print(e.toString());
          emit(AppCategoryErrorState(e));
        });
      }



  FavoriateModel? favoriatemodel ;

      void changeFavoriates(int productId)
      {
        favoriates[productId]  = !favoriates[productId]! ;
      //  emit(AppChangeFavoriateState());
        emit(AppChangeFavoriateSuccessfulState(favoriatemodel));




        DioHelper.postData(
            url: FAVORIATE,
            data: {
              "product_id" : productId
                  },
        token: token

        )!.then((value) {
          //print(value.data);

          favoriatemodel =FavoriateModel.FromJson(value.data);
          if(favoriatemodel!.status == true)
            {
              print(favoriatemodel?.message);
              getFavorateData();

            }
          else
            {
              favoriates[productId]  = !favoriates[productId]! ;
            }

          emit(AppChangeFavoriateSuccessfulState(favoriatemodel));


        }).catchError((e){
          favoriates[productId]  = !favoriates[productId]! ;

          emit(AppChangeFavoriateErrorState(e));
        });
      }

  GetFavoriteModal? getfav;
      getFavorateData()
      {
           emit(AppGetFavoriteLoadingState());
      DioHelper.getData(url: FAVORIATE, token: token)!.then((value) {
        print(value.data);
        if (value.statusCode == 200) {
          getfav = GetFavoriteModal.FromJson(value.data);
          print(getfav?.data!.data);
          emit(AppGetFavoriteSuccessfulState());

      }
        else {


          throw BaseException.StatusCode(value.statusCode!);

        }
      }).catchError((e) {
        print(e.toString());
        emit(AppGetFavoriteErrorState(e));
      });




  }

  LoginModal? Loginnodel ;
      getProfileData()
      {
        emit(AppProfileLoadingState());
        DioHelper.getData(url: PROFILE , token: token)!.then((value) {
          Loginnodel =LoginModal.FromJson(value.data);
          emit(AppProfileSuccessfulState());
        }).catchError((e){
          emit(AppProfileErrorState(e));
        });
      }



  updateProfileData(
  {
    @required String? name ,
    @required String? email ,
    @required String? phone ,
}
      )
  {
    emit(AppUpdateProfileLoadingState());
    DioHelper.putData(
        url: UPDATE ,
        token: token,
      data: {
          'name' : name ,
          'email' : email ,
           'phone' : phone
      }
    ).then((value) {
      Loginnodel =LoginModal.FromJson(value.data);
      emit(AppUpdateProfileSuccessfulState());
    }).catchError((e){
      emit(AppUpdateProfileErrorState(e));
    });
  }


}
