import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_apicall/constant/api_constant.dart';
import 'package:riverpod_apicall/core/dio_exception.dart';

final apiserviceProvider = Provider<ApiService>((ref) {
  return ApiService();
});

class ApiService {
  getData({required String endpoint}) async {
    final Dio dio = Dio(
      BaseOptions(
          baseUrl: Apiconstant.baseUrl, headers: {"accept": "applcation/json"}),
    );
    try {
      final result = await dio.get(endpoint);
      return result.data;
    } on DioError catch (e) {
      throw DioException.fromDioError(e);
    }
  }
}
