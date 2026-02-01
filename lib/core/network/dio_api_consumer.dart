import 'package:dio/dio.dart';

import 'api_consumer.dart';
import '../constants/endpoints.dart';

class DioApiConsumer implements ApiConsumer {
  final Dio dio;
  DioApiConsumer({required this.dio}) {
    dio.options.baseUrl = Endpoints.baseUrl;
    dio.options.headers = {'Content-Type': 'application/json'};
  }

  @override
  Future<dynamic> get(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
  }) {
    return dio.get(
      path,
      queryParameters: data,
      options: Options(headers: headers),
    );
  }

  @override
  Future<dynamic> post(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
  }) {
    if (headers != null) {
      return dio.post(
        path,
        data: data,
        options: Options(headers: headers),
      );
    }
    return dio.post(path, data: data);
  }

  @override
  Future<dynamic> put(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
  }) {
    return dio.put(
      path,
      data: data,
      options: Options(headers: headers),
    );
  }

  @override
  Future<dynamic> delete(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
  }) {
    return dio.delete(
      path,
      data: data,
      options: Options(headers: headers),
    );
  }
}
