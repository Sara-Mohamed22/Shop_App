import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/modules/shop-App/cubit/cubit.dart';
import 'package:shop_app/modules/shop-App/cubit/states.dart';
class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit , AppStates>(
      listener: (context,state){},
      builder: (context ,state){
        AppCubit c =AppCubit.get(context);
        return Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView.separated(
                itemBuilder: (context,index)=> Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Image(
                        image: NetworkImage('${c.categorymodel!.data!.data![index].image}'),
                        width: 90,
                        height: 90,
                      ),
                    ),
                    SizedBox(width: 20,),
                    Text('${c.categorymodel!.data!.data![index].name}' , style: TextStyle(
                        fontSize: 20.0 ,
                        fontWeight: FontWeight.bold
                    ),
                    ),
                   Spacer(),
                    Icon(Icons.arrow_forward_ios),

                  ],
                ),
                separatorBuilder: (context ,index)=> Divider(),
                itemCount: c.categorymodel!.data!.data!.length)



        );
      },

    );
  }
}
