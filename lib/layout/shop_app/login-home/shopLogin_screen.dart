import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/shop_app/register-home/Shop_Register_screen.dart';
import 'package:shop_app/layout/shop_app/shop-home-layout.dart';
import 'package:shop_app/modules/login/cubit/cubit.dart';
import 'package:shop_app/modules/login/cubit/states.dart';
import 'package:shop_app/network/local/cash_helper.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/shared/constant.dart';
import 'package:shop_app/shared/styles/color.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';


class ShopLoginScreen extends StatelessWidget {

  var formKey = GlobalKey<FormState>();


  @override

  Widget build(BuildContext context) {

    var usernameController = TextEditingController();

    var passwordController = TextEditingController();






    return BlocProvider(
      create: (BuildContext context)=> ShopLoginCubit(),
      child:BlocConsumer<ShopLoginCubit , ShopLoginState > (
        listener: (context , state){
          if (state is ShopLoginErrorState) print(state.toString());
          if(state is ShopLoginSucessState )
            {
              //check if user found or not found

              if(state.Logindata!.status == true)
              {
                print(state.Logindata!.data!.token);
                print(state.Logindata!.message);

                CashHelper.saveData(key: 'token', value:state.Logindata!.data!.token ).then((value) {
                  ///to use save new token when old token killed or logout
                  token = state.Logindata!.data!.token! ;

                  Navigator.push(context, MaterialPageRoute(builder: (context)=> ShopLayout()));
                });
              }

              else
                {
                  print(state.Logindata!.message);

                  showToast(message:state.Logindata!.message , state: ToastState.ERROR );

                }
            }
        } ,
        builder:(context , state){
          return     Scaffold(
              appBar: AppBar() ,
              body:Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: formKey ,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start ,
                        children: [
                          Text('Login' ,
                              style: Theme.of(context).textTheme.headline5 ),

                          Text('Login now to browse our hot offers',
                            style:
                            //copyWith means update on origin style
                            Theme.of(context).textTheme.bodyText2!.copyWith(color: Colors.grey) ,),
                          SizedBox(height: 30,),

                          TextFormField(

                            controller: usernameController ,
                            keyboardType: TextInputType.emailAddress ,
                            validator: (value){
                              if(value!.isEmpty) return 'Please enter your email address' ;
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.email_outlined),
                                label: Text('Email Address')


                            ),
                          ),

                          SizedBox(height: 20,),

                          TextFormField(

                            controller: passwordController ,
                            keyboardType: TextInputType.visiblePassword ,
                            obscureText: ShopLoginCubit.get(context).obscuretext ,
                            validator: (value){
                              if(value!.isEmpty) return 'Please enter your password' ;
                            },
                              onFieldSubmitted: (value) {
          if (formKey.currentState!.validate()) {
          ShopLoginCubit.get(context).UserLogin(email: usernameController.text,
          password: passwordController.text);
          }
          },
          decoration: InputDecoration(

          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.lock_open_outlined),
          label: Text('Password'),

          suffixIcon:
          GestureDetector(
          onTap: (){
            print(ShopLoginCubit.get(context).isHidden);
            ShopLoginCubit.get(context).changevisibiliy() ;
          },
          child:
          ShopLoginCubit.get(context).visible


          ))) , SizedBox(height: 30,),

                          Container(

                            width: double.infinity,
                            height: 50,

                              child: ConditionalBuilder(
                                condition: state is! ShopLoginLoadingState ,
                                builder: (context)=> MaterialButton(
                                  shape:  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0), // <-- Radius
                                  ),
                                  color: defaultColor,
                                  onPressed: ()
                                  {
                                    if(formKey.currentState!.validate())
                                      {
                                        ShopLoginCubit.get(context).UserLogin(
                                            email: usernameController.text ,
                                            password: passwordController.text
                                        );



                                      }

                                  }
                                  ,
                                  child: Text('Login' ,
                                    style: TextStyle(
                                        color: Colors.white ,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 19
                                    ),),),
                                fallback: (context)=> Center(child: CircularProgressIndicator()) ,

                              ),
                            ),

                          SizedBox(height: 15,),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Don\'t have account ?' ),
                              TextButton(
                                  onPressed: ()
                                  {
                                    print('Login screen');
                                    NavigateTo(context, ShopRegisterScreen() );


                                  }, child: Text('Register Now'))
                            ],)
                        ],
                      ),
                    ),
                  ),
                ),
              )
          );
        }  ,
      )

    );
  }
}
