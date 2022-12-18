import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_apicall/constant/api_constant.dart';
import 'package:riverpod_apicall/core/api_service.dart';
import 'package:riverpod_apicall/core/app_error.dart';
import 'package:riverpod_apicall/features/users/data/model/user_response_model.dart';

final userRemoteDataSoucreProvider = Provider<UserRemoteDataSource>((ref) {
  return UserRemoteDataSourceImpl(ref.read(apiserviceProvider));
});

abstract class UserRemoteDataSource {
  Future<UserResponseModel> getUsers();
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final ApiService _apiService;

  UserRemoteDataSourceImpl(this._apiService);
  @override
  Future<UserResponseModel> getUsers() async {
    final result = await _apiService.getData(endpoint: Apiconstant.users);
    return UserResponseModel.fromMap(result);
  }
}
