import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/modules/search/search-cubit/search-cubit.dart';
import 'package:shop_app/modules/search/search-cubit/search-state.dart';
import 'package:shop_app/modules/shop-App/cubit/cubit.dart';
import 'package:shop_app/modules/shop-App/cubit/states.dart';
import 'package:shop_app/shared/styles/color.dart';
class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('search',
          style: Theme.of(context).textTheme.bodyText1 ,),

    var _formKey = GlobalKey<FormState>();
    TextEditingController searchController = TextEditingController();

    return BlocProvider(
      create: (context)=> SearchCubit(),
      child: BlocConsumer< SearchCubit,SearchState >(
        listener: (context,state){
          if(state is SearchSuccessfulState)
            {
              print(state.searchmodel!.data!.data![0].name);
              print(state.searchmodel!.data!.data![0].image);
            }
        },
        builder: (context,state){
          SearchCubit c = SearchCubit.get(context);

          return
            Scaffold(
                appBar: AppBar(),
                body: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: _formKey ,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: searchController,
                          keyboardType: TextInputType.text,
                          validator: (value)=> value!.isEmpty ? 'This field required !' : null ,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.search),
                              label: Text('Search'),
                              border: OutlineInputBorder()

                          ),

                          onFieldSubmitted: (value)
                          {
                            print(value);
                            SearchCubit.get(context).getSearchData(value);

                          },
                        ),

                        SizedBox(height: 30,),
                        if(state is SearchLoadingState )
                          LinearProgressIndicator(),
                         if(state is SearchErrorState)
                          Center(child: Text('Not Found , Try Again')),
                        Expanded(
                          child: ListView.separated(
                              itemBuilder: (context, index) =>  Container(
                                height: 150,
                                child: Row(
                                  children: [

                                    Image(
                                      image: NetworkImage(
                                          '${c.searchmodal!.data!.data![index].image}'),
                                      width: 120,
                                      height: 120,
                                      // fit: BoxFit.cover ,
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
                                              '${c.searchmodal!.data!.data![index].name}',
                                              maxLines: 3,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(height: 1.3),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),

                                          ],
                                        ),
                                      ),
                                    )

                                  ] ,
                                ),
                              ),
                              separatorBuilder: (context, index) => Divider(),
                              itemCount: c.searchmodal!.data!.data!.length),
                        )
                      ],
                    ),
                  ),
                )
            )
           ;
        },

      ),
    );
  }
}
