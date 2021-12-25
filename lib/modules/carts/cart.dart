import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/modules/shop-App/cubit/cubit.dart';
import 'package:shop_app/modules/shop-App/cubit/states.dart';
import 'package:shop_app/network/local/cash_helper.dart';
import 'package:shop_app/shared/styles/color.dart';
class CartHome extends StatelessWidget {
  const CartHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppCubit c =AppCubit.get(context) ;

    return BlocConsumer<AppCubit ,AppStates >(
        listener:(BuildContext context,state){

        },
        builder:(context,state){
          return AppCubit.get(context).allCart!.data!.cart_items!.isEmpty ==false ? ConditionalBuilder(
              condition: state is! AppCartsLoadingState ,
              builder: (context) =>  Scaffold(
                appBar: AppBar(),
                body: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListView.separated(
                      itemBuilder: (context, index) =>  Container(
                        height: 150,
                        child: Row(
                          children: [
                            Stack(
                              children: [
                                Image(
                                  image: NetworkImage(
                                      '${c.allCart!.data!.cart_items![index].product!.image}'),
                                  width: 120,
                                  height: 120,
                                  // fit: BoxFit.cover ,
                                ),
                                if (c.allCart!.data!.cart_items![index].product!
                                    .discount !=
                                    0)
                                  Container(
                                    color: Colors.red,
                                    padding:
                                    EdgeInsets.symmetric(horizontal: 5),
                                    child: Text(
                                      'DISCOUNT',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 11),
                                    ),
                                  ),
                              ],
                              alignment: AlignmentDirectional.bottomStart,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  children: [
                                    Text(
                                      '${c.allCart!.data!.cart_items![index].product!.name}',
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(height: 1),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                      Column(
                                      children : [ Text(
                                          '${c.allCart!.data!.cart_items![index].product!.price.round()}',
                                          style:
                                          TextStyle(color: defaultColor),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        if (c.allCart!.data!.cart_items![index]
                                            .product!.discount !=
                                            0)
                                          Text(
                                            ' ${c.allCart!.data!.cart_items![index].product!.old_price}',
                                            style: TextStyle(
                                                color: Colors.grey,
                                                decoration: TextDecoration
                                                    .lineThrough),
                                          ),]),


                                           Spacer(),

                                           Row(
                                            children: [
                                              IconButton(
                                                  onPressed: () {
                                                    print('hi');
                                                    print(c.allCart!.data!.cart_items![index].product!.id);
                                                    c.changeFavoriates(c
                                                        .getfav!
                                                        .data!
                                                        .data![index]
                                                        .product!
                                                        .id!);
                                                  },
                                                  icon: CircleAvatar(
                                                      radius: 15,
                                                      backgroundColor: c.carts[
                                                      c.allCart!.data!.cart_items![index]
                                                          .product!
                                                          .id] ==
                                                          true
                                                          ? Colors.red
                                                          : Colors.grey,
                                                      child: Icon(
                                                        Icons.favorite_border,
                                                        color: Colors.white,
                                                        size: 18,
                                                      ))),
                                              IconButton(onPressed: (){
                                                print('shop now');
                                              }, icon:CircleAvatar(
          radius: 15,
          backgroundColor:
       /*   c.carts[
          c.allCart!.data!.cart_items![index]
              .product!
              .id] ==
          true
          ? Colors.red
              :*/
          Colors.grey,
          child: Icon(
          Icons.shopping_cart,
          color: Colors.white,
          size: 18,
          ))

                                              ),
                                            ],
                                          ),

                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      separatorBuilder: (context, index) => Divider(),
                      itemCount: c.allCart!.data!.cart_items!.length),
                ),
              )  ,
              fallback: (context) =>
                  Center(child: CircularProgressIndicator())  ) :
          Center(child: Text('Empty',style: TextStyle(fontWeight: FontWeight.bold),));


        });
  }
}
