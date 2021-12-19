


import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/shared/styles/color.dart';

class ShopRegisterScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    TextEditingController nameController =TextEditingController();
    TextEditingController phoneController =TextEditingController();
    TextEditingController emailController =TextEditingController();
    TextEditingController passController =TextEditingController();

    var _formKey=GlobalKey<FormState>();


        return Scaffold(
          appBar: AppBar(),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
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
                      SizedBox(height: 20,),
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
                         obscureText:  true ,
                          // ShopLoginCubit.get(context).obscuretext,
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
                                  // print(ShopLoginCubit.get(context).isHidden);
                                  // ShopLoginCubit.get(context).changevisibiliy() ;
                                },
                                child:Icon(Icons.lock)
                              //  ShopLoginCubit.get(context).visible


                            )


                        ),
                      ),

                      SizedBox(height: 20,),

                      Container(

                        width: double.infinity,
                        height: 50,

                        child: ConditionalBuilder(
                          condition: false ,
                          //state is! ShopLoginLoadingState ,
                          builder: (context)=> MaterialButton(
                            shape:  RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0), // <-- Radius
                            ),
                            color: defaultColor,
                            onPressed: ()
                            {
                              if(_formKey.currentState!.validate())
                              {




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

                    ]
                ),
              ),
            ),
          ),
        );
      }



}
