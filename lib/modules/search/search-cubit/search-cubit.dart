import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/models/shop-app/category-model.dart';
import 'package:shop_app/modules/search/search-cubit/search-state.dart';
import 'package:shop_app/network/end_points.dart';
import 'package:shop_app/network/remote/dio_helper.dart';
import 'package:shop_app/shared/constant.dart';

class SearchCubit extends Cubit<SearchState>
{
  SearchCubit(): super(SearchInitializeState());

  CategoryModal? searchmodal ;

  static SearchCubit get(context)=> BlocProvider.of(context) ;

  getSearchData(String? text)
  {
    emit(SearchLoadingState());

    DioHelper.postData(
        url: SEARCH ,
        token: token,
        data:
        {'text' : text},
      lang: 'en',

    )!.then((value) {


      searchmodal= CategoryModal.FromJson(value.data);
      print(searchmodal!.data!.data![0].id);
      emit(SearchSuccessfulState(searchmodal));

    }).catchError((e){
      emit(SearchErrorState(e));
    });
  }

}