import 'package:dio/dio.dart';
import 'package:fibo_ecco64/core/network/ApiService.dart';

class DioHelper implements ApiService {
  final dio = Dio();

  @override
  Future get(String path, {Map<String, dynamic>? query}) async {
    try {
      final response = await dio.get(path, queryParameters: query);
      return response.data;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future post(String path,
      {Map<String, dynamic>? body, Map<String, dynamic>? query}) async {
    try {
      final response = await dio.post(path, queryParameters: query, data: body);
      return response.data;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
