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
          IconButton(
              onPressed: () {
                context.push(AppRouter.splash);
              },
              icon: Icon(Icons.search))
        ],
      ),
      body: BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
        if (state is HomeLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is HomeSuccess) {
          return ListView.builder(
              itemCount: state.articles.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.articles[index].title ?? "no title"),
                );
              });
        }
        if (state is HomeError) {
          return Center(
            child: Text(state.message),
          );
        }
        return Center(
          child: Text("not empty"),
        );
      }),
    );
  }
}
