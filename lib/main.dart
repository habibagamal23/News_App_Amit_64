import 'package:dio/dio.dart';
import 'package:fibo_ecco64/core/AppRouter/AppRouter.dart';
import 'package:fibo_ecco64/core/di/getitHelper.dart';
import 'package:fibo_ecco64/core/network/ApiService.dart';
import 'package:fibo_ecco64/core/network/Dio/DioHelper.dart';
import 'package:fibo_ecco64/features/home/presentation/manager/home_cubit.dart';
import 'package:fibo_ecco64/features/search/data/repositories/searchRepo.dart';
import 'package:fibo_ecco64/features/search/presentation/manager/search_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/home/data/repositories/HomeRepo.dart';

void main() {
  setUp();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (_) => getit<HomeCubit>()..showTopHeadlines(),
      ),
      BlocProvider(
        create: (context) => getit<SearchCubit>(),
      ),
    ],
    child: MyApp(),
  ));
  //getTopHeadlines();
}

// getTopHeadlines() async {
//   final dio = Dio();
//   try {
//     final respo = await dio.get("https://newsapi.org/v2/top-headlines",
//         queryParameters: {
//           "apiKey": "4881729f455449e2834a0f136da1bd9b",
//           "country": "us"
//         });
//     print(respo.data["articles"][0]["title"]);
//   } catch (e) {
//     print(e.toString());
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
    );
  }
}
