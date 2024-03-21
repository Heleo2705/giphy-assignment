// import 'package:dhara/data/utils/logging_utils.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiHelper {
  final Dio dio = Dio();
  final String baseUrl;

  ApiHelper(this.baseUrl) {
    dio.interceptors.add(PrettyDioLogger(
      error: true,
      request: true,
      requestBody: true,
      responseBody: true,
      requestHeader: true,
      responseHeader: true,
    ));
    // logger.i(baseUrl);
  }

  Future<Response> get(
      {required String path, dynamic body, Options? options}) async {
    try {
      final response = await dio.get<dynamic>(
        baseUrl + path,
        data: body,
        options: options,
      );
      return response;
    } on Exception catch (e) {
      return Future.error(e);
    }
  }

  Future<Response> post(
      {required String path, required dynamic body, Options? options}) async {
    try {
      final response = await dio.post<dynamic>(
        baseUrl + path,
        data: body,
        options: options,
      );
      return response;
    } on Exception catch (e) {
      return Future.error(e);
    }
  }
}