import 'package:fibo_ecco64/core/networks/api_service.dart';
import 'package:fibo_ecco64/core/networks/dio_helper.dart';
import 'package:fibo_ecco64/features/home/data/models/newsModel.dart';

import '../../../../core/networks/api_constant.dart';

class HomeRepo {
  ApiService apiService = DioHelper();

  Future<List<Articles>?> getTopHeadlines() async {
    try {
      final data =
          await apiService.get(ApiConstants.Topheadlines, queryParameters: {
        'country': ApiConstants.country,
        'apiKey': ApiConstants.apiKey,
      });
      final news = NewsModel.fromJson(data);
      return news.articles;
    } catch (e) {
      throw Exception('Failed to load top headlines: $e');
    }
  }
}
