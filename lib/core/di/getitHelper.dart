import 'package:fibo_ecco64/core/network/ApiService.dart';
import 'package:fibo_ecco64/core/network/Dio/DioHelper.dart';
import 'package:fibo_ecco64/features/home/data/repositories/HomeRepo.dart';
import 'package:fibo_ecco64/features/home/presentation/manager/home_cubit.dart';
import 'package:fibo_ecco64/features/search/data/repositories/searchRepo.dart';
import 'package:fibo_ecco64/features/search/presentation/manager/search_cubit.dart';
import 'package:get_it/get_it.dart';

final getit = GetIt.instance;

void setUp() {
  getit.registerSingleton<ApiService>(DioHelper());
  // home objects
  getit.registerSingleton<HomeRepo>(HomeRepo(getit<ApiService>()));
  getit.registerSingleton<HomeCubit>(HomeCubit(getit<HomeRepo>()));
  // search objjects
  getit.registerFactory<SearchRepo>(()=> SearchRepo(getit<ApiService>));
  getit.registerFactory<SearchCubit>(()=> SearchCubit(getit<SearchRepo>()));




}
