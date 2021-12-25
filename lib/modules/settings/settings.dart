import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/shop_app/login-home/shopLogin_screen.dart';
import 'package:shop_app/modules/shop-App/cubit/cubit.dart';
import 'package:shop_app/modules/shop-App/cubit/states.dart';
import 'package:shop_app/network/local/cash_helper.dart';
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    AppCubit c = AppCubit.get(context);

    var _formKey = GlobalKey<FormState>();

    TextEditingController nameController = TextEditingController(text:  c.Loginnodel!.data!.name);
    TextEditingController emailController = TextEditingController(text:  c.Loginnodel!.data!.email);
    TextEditingController phoneController = TextEditingController(text:  c.Loginnodel!.data!.phone);


    return
      BlocConsumer<AppCubit , AppStates>(
        listener: (context ,state){},
        builder: (context , state){
          return ConditionalBuilder(
            condition: c.Loginnodel !=null ,
            builder: (context)=> Padding(
              padding: const EdgeInsets.all(15.0),
              child: SingleChildScrollView(

                child: Form(
                  key: _formKey,
                  child: Column(

                    children: [
                      if(state is AppUpdateProfileLoadingState )
                        LinearProgressIndicator(),
                        SizedBox(height: 10,),
                        TextFormField(
                        controller: nameController,
                        keyboardType: TextInputType.name,
                        validator: (value)=> value!.isEmpty ? 'This field Required' : null ,
                        decoration: InputDecoration(
                            label: Text('Name'),
                            prefixIcon: Icon(Icons.person),
                            border: OutlineInputBorder()
                        ),


                      ),
                      SizedBox(height: 20,),
                      TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value)=> value!.isEmpty ? 'This field Required' : null ,
                        decoration: InputDecoration(
                            label: Text('Email'),
                            prefixIcon: Icon(Icons.mail),
                            border: OutlineInputBorder()
                        ),



                      ),
                      SizedBox(height: 20,),
                      TextFormField(
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        validator: (value)=> value!.isEmpty ? 'This field Required' : null ,
                        decoration: InputDecoration(
                            label: Text('Phone'),
                            prefixIcon: Icon(Icons.call),
                            border: OutlineInputBorder()
                        ),



                      ),
                      SizedBox(height: 20,),
                      Container(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(onPressed: (){
                            if(_formKey.currentState!.validate())
                            {
                              print('update');
                                AppCubit.get(context).updateProfileData(
                                    name: nameController.text,
                                    email: emailController.text,
                                    phone: phoneController.text);
                              }
                            }, child: Text('Update'))),

                      SizedBox(height: 20,),

                      Container(
                        width: double.infinity,
                          height: 50,
                          child: ElevatedButton(onPressed: (){
                            CashHelper.removeData(key: 'token').then((value) {
                              print('logout Successfully !');
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> ShopLoginScreen()));
                            }).catchError((e){
                              print('error in logout ${e.toString()}');
                            });
                          }, child: Text('LOGOUT'))),

                    ],
                  ),
                ),
              ),
            ),
            fallback: (context)=> Center(child: CircularProgressIndicator()),
           );
        },

      );
  }
}


















// child: Column(
// children: [
// TextFormField(
// controller: nameController,
// keyboardType: TextInputType.name,
// validator: (value)=> value!.isEmpty ? 'This field Required' : null ,
// decoration: InputDecoration(
// label: Text('Name'),
// prefixIcon: Icon(Icons.person),
// enabledBorder: OutlineInputBorder()
// ),
//
// ),
// SizedBox(height: 20,),
// TextFormField(
// controller: emailController,
// keyboardType: TextInputType.emailAddress,
// validator: (value)=> value!.isEmpty ? 'This field Required' : null ,
// decoration: InputDecoration(
// label: Text('Email'),
// prefixIcon: Icon(Icons.mail),
// enabledBorder: OutlineInputBorder()
// ),
//
//
//
// ),
// SizedBox(height: 20,),
// TextFormField(
// controller: phoneController,
// keyboardType: TextInputType.phone,
// validator: (value)=> value!.isEmpty ? 'This field Required' : null ,
// decoration: InputDecoration(
// label: Text('Phone'),
// prefixIcon: Icon(Icons.call),
// enabledBorder: OutlineInputBorder()
// ),
//
//
//
// ),
// SizedBox(height: 20,),
//
// Container(
// width: double.infinity,
// height: 50,
// child: ElevatedButton(onPressed: (){
// CashHelper.removeData(key: 'token').then((value) {
// print('logout Successfully !');
// Navigator.push(context, MaterialPageRoute(builder: (context)=> ShopLoginScreen()));
// }).catchError((e){
// print('error in logout ${e.toString()}');
// });
// }, child: Text('LOGOUT')))
// ],*/