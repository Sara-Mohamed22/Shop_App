import 'package:shop_app/models/shop-app/login_modal.dart';

abstract class ShopRegisterState {}

class ShopRegisterInitialState extends ShopRegisterState {}

class ShopRegisterLoadingState extends ShopRegisterState {}

class ShopRegisterSucessState extends ShopRegisterState {
  final LoginModal? Logindata ;
  ShopRegisterSucessState(this.Logindata);
}


class ShopRegisterErrorState extends ShopRegisterState {
  final String error ;
  ShopRegisterErrorState(this.error);
}


class ShowHidden extends ShopRegisterState {}
