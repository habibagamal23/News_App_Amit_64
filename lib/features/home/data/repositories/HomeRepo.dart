import 'package:fibo_ecco64/core/network/ApiConstant.dart';
import 'package:fibo_ecco64/core/network/ApiReslut.dart';
import 'package:fibo_ecco64/core/network/ApiService.dart';
import 'package:fibo_ecco64/core/network/Dio/DioHelper.dart';
import 'package:fibo_ecco64/features/home/data/models/ArticleModel.dart';

class HomeRepo {
ApiService service;
  HomeRepo(this.service);

  Future<ApiResult<List<ArticleModel>>> getTopHeadlines() async {
    try {
      final data = await service.get(ApiConstant.EndPointTopHeadlines,
          query: {"apiKey": ApiConstant.apiKey, "country": "us"});
      var articaList = data["articles"] as List;
      var successArticalList =
          articaList.map((artical) => ArticleModel.formJson(artical)).toList();
      return ApiResult.Success(successArticalList);
    } catch (e) {
      return ApiResult.Error(e.toString());
    }
  }
}
