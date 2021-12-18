import 'package:shop_app/models/shop-app/login_modal.dart';

abstract class ShopLoginState {}

 class ShopLoginInitialState extends ShopLoginState {}

class ShopLoginLoadingState extends ShopLoginState {}

class ShopLoginSucessState extends ShopLoginState {
 final LoginModal? Logindata ;
 ShopLoginSucessState(this.Logindata);
}


class ShopLoginErrorState extends ShopLoginState {
 final String error ;
 ShopLoginErrorState(this.error);
}


class ShowHidden extends ShopLoginState {}
