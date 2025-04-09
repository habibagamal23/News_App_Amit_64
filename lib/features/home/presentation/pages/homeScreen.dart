import 'package:fibo_ecco64/core/AppRouter/AppRouter.dart';
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

    );
  }
}
