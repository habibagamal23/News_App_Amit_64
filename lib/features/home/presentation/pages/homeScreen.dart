import 'package:fibo_ecco64/core/AppRouter/AppRouter.dart';
import 'package:fibo_ecco64/features/home/presentation/manager/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            context.push(AppRouter.search);
          }, icon: Icon(Icons.search))
        ],
      ),
      body: BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
        if (state is HomeLoading) {
          return CircularProgressIndicator();
        }
        if (state is HomeError) {
          return Text(state.error);
        }

        if (state is HomeSuccess) {
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
      }),
    );
  }
}
