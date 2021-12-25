
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/modules/carts/cart.dart';
import 'package:shop_app/modules/search/search.dart';
import 'package:shop_app/modules/shop-App/cubit/cubit.dart';
import 'package:shop_app/modules/shop-App/cubit/states.dart';
class ShopLayout extends StatelessWidget {
  const ShopLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<AppCubit ,AppStates >(
      listener:(context , state){

      } ,
      builder: (context , state){
        return Scaffold(
          appBar: AppBar(title: Text('Salla'),
          actions: [
            Row(
              children: [
                IconButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>
                      SearchScreen()));
                }, icon: Icon(Icons.search),),
                IconButton(
                  icon:
                  Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      Icon(Icons.shopping_cart ,size: 27, ),
                      Container(
                        alignment: Alignment.topRight,
                        child: CircleAvatar(
                          backgroundColor:Colors.red  ,
                          radius: 9,
                          child: Center(
                            child:
                            Text('${AppCubit.get(context).x}', style: TextStyle(color: Colors.white ,
                                fontSize: 11,
                                fontWeight: FontWeight.bold),)

                          ),
                        ),
                      )

                    ],
                  ),

                  onPressed: (){
                    print('cart');
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> CartHome() ));
                  },
                ),

              ],
            )

          ],),

          body: AppCubit.get(context).screens[AppCubit.get(context).currentIndex],

          bottomNavigationBar: BottomNavigationBar(
              currentIndex: AppCubit.get(context).currentIndex ,
              onTap: (index)
              {
                print(index);
                AppCubit.get(context).changeNavigationBar(index);
              },

              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home) , label: 'Home'),
                BottomNavigationBarItem(icon: Icon(Icons.apps) , label: 'Categories'),
                BottomNavigationBarItem(icon: Icon(Icons.favorite) , label: 'Favorites'),
                BottomNavigationBarItem(icon: Icon(Icons.settings) , label: 'Settings'),
              ]

          ),
        );
      },
    );
  }
}
