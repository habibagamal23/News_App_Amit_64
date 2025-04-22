import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../home/data/models/ArticleModel.dart';
import '../../data/repositories/searchRepo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  SearchRepo searchRepo = SearchRepo();
  searchforArticl(String search)async{
    emit(SearchLoading());
    final result = await searchRepo.searchForarticales(search);
    if(result.isSuccess){
      emit(SearchSuccess(result.data!));
    }else{
      emit(SearchError(result.error!));
    }
  }

}
