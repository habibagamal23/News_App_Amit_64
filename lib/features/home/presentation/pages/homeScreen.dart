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
                return ListTile(
                  title: Text(state.articleList[index].title ?? "no title"),
                  subtitle: Text(
                      state.articleList[index].description ?? "no description"),
                );
              });
        }
        return Container();
      }),
    );
  }
}
