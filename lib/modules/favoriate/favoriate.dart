import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/modules/shop-App/cubit/cubit.dart';
import 'package:shop_app/modules/shop-App/cubit/states.dart';
import 'package:shop_app/shared/styles/color.dart';
class FavoriateScreen extends StatelessWidget {
  const FavoriateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('koky ${AppCubit.get(context).getfav!.data!.data!.isEmpty}');
    return BlocConsumer<AppCubit ,AppStates >(
      listener:(BuildContext context,state){

      },
        builder:(context,state){
          AppCubit c =AppCubit.get(context) ;
            return AppCubit.get(context).getfav!.data!.data!.isEmpty ==false ? ConditionalBuilder(
                condition: state is! AppGetFavoriteLoadingState,
                builder: (context) =>  ListView.separated(
                    itemBuilder: (context, index) =>  Container(
                          height: 150,
                          child: Row(
                            children: [
                              Stack(
                                children: [
                                  Image(
                                    image: NetworkImage(
                                        '${c.getfav!.data!.data![index].product!.image}'),
                                    width: 120,
                                    height: 120,
                                    // fit: BoxFit.cover ,
                                  ),
                                  if (c.getfav!.data!.data![index].product!
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
                                        '${c.getfav!.data!.data![index].product!.name}',
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(height: 1.3),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            '${c.getfav!.data!.data![index].product!.price.round()}',
                                            style:
                                                TextStyle(color: defaultColor),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          if (c.getfav!.data!.data![index]
                                                  .product!.discount !=
                                              0)
                                            Text(
                                              '${c.getfav!.data!.data![index].product!.old_price}',
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  decoration: TextDecoration
                                                      .lineThrough),
                                            ),
                                          Spacer(),
                                          IconButton(
                                              onPressed: () {
                                                print('hi');
                                                print(c.getfav!.data!
                                                    .data![index].product!.id);
                                                c.changeFavoriates(c
                                                    .getfav!
                                                    .data!
                                                    .data![index]
                                                    .product!
                                                    .id!);
                                              },
                                              icon: CircleAvatar(
                                                  radius: 15,
                                                  backgroundColor: c.favoriates[
                                                              c
                                                                  .getfav!
                                                                  .data!
                                                                  .data![index]
                                                                  .product!
                                                                  .id] ==
                                                          true
                                                      ? Colors.red
                                                      : Colors.grey,
                                                  child: Icon(
                                                    Icons.favorite_border,
                                                    color: Colors.white,
                                                    size: 18,
                                                  )))
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
                    itemCount: c.getfav!.data!.data!.length)  ,
                fallback: (context) =>
                      Center(child: CircularProgressIndicator())  ) :
            Center(child: Text('Empty',style: TextStyle(fontWeight: FontWeight.bold),));


        });

        }


  }

