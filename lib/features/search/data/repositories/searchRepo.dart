import 'package:fibo_ecco64/core/network/ApiConstant.dart';
import 'package:fibo_ecco64/core/network/ApiReslut.dart';
import 'package:fibo_ecco64/core/network/ApiService.dart';
import 'package:fibo_ecco64/core/network/Dio/DioHelper.dart';
import 'package:fibo_ecco64/features/home/data/models/ArticleModel.dart';

class SearchRepo {
  ApiService apiService ;
SearchRepo(this.apiService);
  Future<ApiResult<List<ArticleModel>>> searchForarticales(
      String search) async {
    try {
      final data = await apiService.get(ApiConstant.EndPointTopHeadlines,
          query: {"apiKey": ApiConstant.apiKey, "country": "us", "q": search});
      // data map{artical }
      final articals = data["articles"] as List;
// to converte map article form api to ArticleModel
      final successArticls =
          articals.map((article) => ArticleModel.formJson(article)).toList();
      return ApiResult.Success(successArticls);
    } catch (e) {
      return ApiResult.Error(e.toString());
    }
  }
}
