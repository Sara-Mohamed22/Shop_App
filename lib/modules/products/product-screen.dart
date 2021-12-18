import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app/models/shop-app/home_model.dart';
import 'package:shop_app/modules/shop-App/cubit/cubit.dart';
import 'package:shop_app/modules/shop-App/cubit/states.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/shared/styles/color.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      AppCubit c = AppCubit.get(context);

    return BlocConsumer<AppCubit , AppStates>(
      listener: (context,state){
        if(state is AppChangeFavoriateSuccessfulState)
          {
            if(state.fmodel!.status == false)
              {
                showToast(message:'${state.fmodel!.message}' ,state: ToastState.ERROR );
              }
          }
      },
      builder: (context,state){
        return ConditionalBuilder(
          condition: c.homemodel != null && c.categorymodel !=null ,
          builder: (context)=> SingleChildScrollView(
            physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                [

                CarouselSlider(

                    items: c.homemodel!.data!.banners!.map((e) {
    return    Image(image: NetworkImage('${e.image}'),
                      width: double.infinity,
                      fit: BoxFit.cover,);
                       }).toList() ,

                    options: CarouselOptions(
                      height: 200 ,
                        initialPage: 0,
                        aspectRatio: 16/9,
                        viewportFraction: 1.0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        scrollDirection: Axis.horizontal
                    )),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Categories' , style: TextStyle(fontWeight: FontWeight.w600 , fontSize: 24.0),),
                         SizedBox(height: 20,),
                        Container(
                          height: 100,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal ,
                              physics: BouncingScrollPhysics(),
                              itemBuilder: (context , index)=>Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children:
        [
        Image(image: NetworkImage('${c.categorymodel?.data?.data![index].image}'),
        width: 100, height: 100,
        fit: BoxFit.cover,),
        Container(
        width: 100,
        height: 30,
        alignment: Alignment.center,
        color: Colors.black.withOpacity(0.5),
        child: Text('${c.categorymodel?.data!.data![index].name}' , style: TextStyle(color: Colors.white  ),
          textAlign:TextAlign.center ,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,)),

        ],) ,
                              separatorBuilder: (context ,index)=> SizedBox(width: 15,),
                              itemCount: c.categorymodel!.data!.data!.length),
                        ),

                        SizedBox(height: 20,),
                        Text('New Products' , style: TextStyle(fontWeight: FontWeight.w600 , fontSize: 23.0 ),),
                        SizedBox(height: 20,),
                      ],
                    ),
                  ),

                  Container(
                    color: Colors.white,
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2 ,
                        mainAxisSpacing: 1 ,
                        crossAxisSpacing: 1,
                        childAspectRatio: 1/2
                      ),
                        itemBuilder:(context,index)=> Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(

                              children: [

                                Image(image: NetworkImage('${c.homemodel!.data!.products![index].image}'),
                                  width: double.infinity,
                                  height: 200,
                                  // fit: BoxFit.cover ,
                                ),
                                if(  c.homemodel!.data!.products![index].discount!=0)
                                Container(
                                  color: Colors.red,
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  child: Text('DISCOUNT' ,
                                  style: TextStyle(color: Colors.white , fontSize: 11),),),

                              ],
                              alignment: AlignmentDirectional.bottomStart,
                            ),

                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  Text('${c.homemodel!.data!.products![index].name}' ,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  style: TextStyle(height: 1.3),),
                                  SizedBox(height: 5,),
                                  Row(children: [
                                    Text('${c.homemodel!.data!.products![index].price.round()}' ,
                                      style:TextStyle(color: defaultColor) ,),
                                    SizedBox(width: 5,),
                                  if(  c.homemodel!.data!.products![index].discount!=0)  Text('${c.homemodel!.data!.products![index].oldPrice}' ,
                                      style: TextStyle(color: Colors.grey,
                                          decoration: TextDecoration.lineThrough ),

                                    ),

                                    Spacer(),
                                    IconButton(onPressed: (){
                                      print('hi');
                                      print(c.homemodel!.data!.products![index].id );
                                      c.changeFavoriates(c.homemodel!.data!.products![index].id!);


                                    }, icon:  CircleAvatar(
                                      radius: 15,
                                        backgroundColor: c.favoriates[c.homemodel!.data!.products![index].id] == true ? Colors.red : Colors.grey,
                                        child: Icon(Icons.favorite_border , color: Colors.white,size: 18,))

                                    )],
                              ),



                              ],),
                            )
                          ],
                        )  ,
                        itemCount: c.homemodel!.data!.products!.length,
                    ),
                  )

                ],),
              ) ,
          fallback: (context)=> Center(child: CircularProgressIndicator()),

        );
      },

    );

  }
}
