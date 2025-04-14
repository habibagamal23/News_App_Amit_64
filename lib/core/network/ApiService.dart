abstract class ApiService {
  Future<dynamic> get(String path, {Map<String, dynamic>? query});
  Future<dynamic> post(String path,
      {Map<String, dynamic>? body, Map<String, dynamic>? query});
}
