


import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/modules/register/cubit/register_cubit.dart';
import 'package:shop_app/modules/register/cubit/register_state.dart';
import 'package:shop_app/network/local/cash_helper.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/shared/constant.dart';
import 'package:shop_app/shared/styles/color.dart';

import '../shop-home-layout.dart';

class ShopRegisterScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    TextEditingController nameController =TextEditingController();
    TextEditingController phoneController =TextEditingController();
    TextEditingController emailController =TextEditingController();
    TextEditingController passController =TextEditingController();

    var _formKey=GlobalKey<FormState>();


        return BlocProvider(
          create: (context)=> ShopRegisterCubit(),
          child: BlocConsumer<ShopRegisterCubit,ShopRegisterState>(
            listener: (context ,state){
              if(state is ShopRegisterSucessState )
                {
                  if(state.Logindata!.status == true) {

              CashHelper.saveData(key: 'token', value:state.Logindata!.data!.token ).then((value) {
                ///to use save new token when old token killed or logout
                token = state.Logindata!.data!.token! ;

                // showToast(
                //     message: '${state.Logindata!.message}',
                //     state: ToastState.SUCCESS);

                Navigator.push(context, MaterialPageRoute(builder: (context)=> ShopLayout()));
              });


                  }

                  else
                    {
                      showToast(
                          message: '${state.Logindata!.message}',
                          state: ToastState.ERROR);
                    }
          }
            },
            builder: (context,state){
              return Scaffold(
                appBar: AppBar(),
                body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20 , vertical: 1),
                    child: Form(
                      key: _formKey,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:
                          [
                            Text('Register' ,
                                style: Theme.of(context).textTheme.headline5 ),

                            Text('Register now to browse our hot offers',
                              style:
                              //copyWith means update on origin style
                              Theme.of(context).textTheme.bodyText2!.copyWith(color: Colors.grey) ,),
                           // SizedBox(height: 10,),
                            TextFormField(

                              controller: nameController ,
                              keyboardType: TextInputType.name ,
                              validator: (value){
                                if(value!.isEmpty) return 'Please enter your name' ;
                              },
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  prefixIcon: Icon(Icons.person),
                                  label: Text('Name')


                              ),
                            ),

                            SizedBox(height: 20,),

                            TextFormField(

                              controller: phoneController ,
                              keyboardType: TextInputType.phone ,
                              validator: (value){
                                if(value!.isEmpty) return 'Please enter Phone Number' ;
                              },
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  prefixIcon: Icon(Icons.call),
                                  label: Text('Phone')


                              ),
                            ),

                            SizedBox(height: 20,),

                            TextFormField(

                              controller: emailController ,
                              keyboardType: TextInputType.emailAddress ,
                              validator: (value){
                                if(value!.isEmpty) return 'Please enter your Email Address' ;
                              },
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  prefixIcon: Icon(Icons.email_outlined),
                                  label: Text('Email Address')


                              ),
                            ),

                            SizedBox(height: 20,),
                            TextFormField(

                              controller: passController ,
                              keyboardType: TextInputType.phone ,
                              obscureText: ShopRegisterCubit.get(context).obscuretext,
                              validator: (value){
                                if(value!.isEmpty) return 'Please enter Password' ;
                              },
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  prefixIcon: Icon(Icons.lock),
                                  label: Text('Password'),
                                  suffixIcon:
                                  GestureDetector(
                                      onTap: (){
                                         print(ShopRegisterCubit.get(context).isHidden);
                                         ShopRegisterCubit.get(context).changevisibiliy() ;
                                      },
                                      child: ShopRegisterCubit.get(context).visible


                                  )


                              ),
                            ),

                            SizedBox(height: 20,),

                            Container(

                              width: double.infinity,
                              height: 50,

                              child: ConditionalBuilder(
                                condition: state is! ShopRegisterLoadingState ,
                                builder: (context)=> MaterialButton(
                                  shape:  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0), // <-- Radius
                                  ),
                                  color: defaultColor,
                                  onPressed: ()
                                  {
                                    if(_formKey.currentState!.validate())
                                    {

                                      ShopRegisterCubit.get(context).
                                      UserRegister(
                                          email: emailController.text,
                                          password: passController.text ,
                                          name: nameController.text ,
                                          phone: phoneController.text );



                                    }

                                  }
                                  ,
                                  child: Text('Register' ,
                                    style: TextStyle(
                                        color: Colors.white ,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 19
                                    ),),),
                                fallback: (context)=> Center(child: CircularProgressIndicator()) ,

                              ),
                            ),

                          ]
                      ),
                    ),
                  ),
                ),
              );
            },

          ),
        );
      }



}
