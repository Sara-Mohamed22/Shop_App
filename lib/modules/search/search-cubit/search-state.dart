import 'package:shop_app/models/shop-app/category-model.dart';

abstract class SearchState{}

class SearchInitializeState extends SearchState {}

class SearchLoadingState extends  SearchState {}
class SearchSuccessfulState extends SearchState {
  final CategoryModal? searchmodel;
  SearchSuccessfulState(this.searchmodel);

}

class SearchErrorState extends SearchState {
  final dynamic error ;
   SearchErrorState(this.error);
}