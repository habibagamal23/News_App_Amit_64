import 'package:dio/dio.dart';
import 'package:fibo_ecco64/core/networks/api_service.dart';

class DioHelper implements ApiService {
  Dio dio = Dio();

  @override
  Future get(String path, {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await dio.get(path, queryParameters: queryParameters);
      return response.data;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
