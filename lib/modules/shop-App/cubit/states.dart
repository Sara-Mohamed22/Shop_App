import 'package:shop_app/models/shop-app/favorite_model.dart';

abstract class AppStates {}

class AppStateInitialize extends AppStates {}

class BottomNavBarState extends AppStates {}

class AppLoadingState extends AppStates {}

class AppSuccessfulState extends AppStates {}

class AppErrorState extends AppStates {
  final dynamic error ;
  AppErrorState(this.error) ;
}

class AppCategorySuccessfulState extends AppStates {}

class AppCategoryErrorState extends AppStates {
  final dynamic error ;
  AppCategoryErrorState(this.error) ;
}

class AppChangeFavoriateState extends AppStates {}
class AppChangeFavoriateSuccessfulState extends AppStates {
  final FavoriateModel? fmodel ;
  AppChangeFavoriateSuccessfulState(this.fmodel);

}

class AppChangeFavoriateErrorState extends AppStates {
  final dynamic error ;
  AppChangeFavoriateErrorState(this.error) ;
}

class AppGetFavoriteLoadingState extends AppStates {}

class AppGetFavoriteSuccessfulState extends AppStates {}
class AppGetFavoriteEmptyState extends AppStates {}


class AppGetFavoriteErrorState extends AppStates {
  final dynamic error ;
  AppGetFavoriteErrorState(this.error) ;
}



class AppProfileLoadingState extends AppStates {}
class AppProfileSuccessfulState extends AppStates {}

class AppProfileErrorState extends AppStates {
  final dynamic error ;
  AppProfileErrorState(this.error);
}





class AppUpdateProfileLoadingState extends AppStates {}
class AppUpdateProfileSuccessfulState extends AppStates {}

class AppUpdateProfileErrorState extends AppStates {
  final dynamic error ;
  AppUpdateProfileErrorState(this.error);
}

