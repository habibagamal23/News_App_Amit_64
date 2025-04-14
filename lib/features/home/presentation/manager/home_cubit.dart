import 'package:fibo_ecco64/features/home/data/models/ArticleModel.dart';
import 'package:fibo_ecco64/features/home/data/repositories/HomeRepo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  HomeRepo rep = HomeRepo();

  showTopHeadlines() async {
    emit(HomeLoading());
    final result = await rep.getTopHeadlines();
    if (result.isSuccess) {
      emit(HomeSuccess(result.data!));
    } else {
      emit(HomeError(result.error!));
    }
  }
}
