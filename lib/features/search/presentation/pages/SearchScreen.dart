import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/AppRouter/AppRouter.dart';
import '../manager/search_cubit.dart';

class Searchscreen extends StatelessWidget {
  const Searchscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            onChanged: (word){
              context.read<SearchCubit>().searchforArticl(word);
            },
            decoration: InputDecoration(
              label: Text("Search"),
            ),
          ),
          Expanded(child: BlocBuilder<SearchCubit, SearchState>(builder: (context, state) {
            if (state is SearchLoading) {
              return CircularProgressIndicator();
            }
            if (state is SearchError) {
              return Text(state.error);
            }
            if (state is SearchSuccess) {
              return ListView.builder(
                  itemCount: state.articleList.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.grey,
                      margin: EdgeInsets.all(10),
                      elevation: 3,
                      child: ListTile(
                        onTap: (){
                          context.push(AppRouter.detailes,
                              extra:state.articleList[index] );
                        },
                        leading: state.articleList[index].urlToImage==null?Icon(Icons.person):
                        Image.network(state.articleList[index].urlToImage!),
                        title: Text(state.articleList[index].title ?? "no title"),
                        subtitle: Text(
                            state.articleList[index].description ?? "no description"),
                      ),
                    );
                  });
            }
            return Container();
          }),)
        ],
      ),

    );
  }
}
