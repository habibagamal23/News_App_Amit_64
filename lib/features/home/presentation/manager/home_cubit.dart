import 'package:bloc/bloc.dart';
import 'package:fibo_ecco64/features/home/data/repositories/HomeRepoImplemntion.dart';
import 'package:meta/meta.dart';

import '../../data/models/newsModel.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  HomeRepo repo = HomeRepo();

  getTopheadarticls() async {
    emit(HomeLoading());
    try {
      final list = await repo.getTopHeadlines();
      if (list != null && list.isNotEmpty) {
        emit(HomeSuccess(list!));
      } else {
        emit(HomeError("empty"));
      }
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }
}
