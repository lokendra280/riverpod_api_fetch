import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_apicall/core/app_error.dart';
import 'package:riverpod_apicall/core/dio_exception.dart';
import 'package:riverpod_apicall/features/users/data/model/user_response_model.dart';
import '../data_sources/user_remote_soucre_data.dart';

final userRepositoryProvider = Provider<UserRepository>((ref) {
  return UserRepositoryImpl(ref.read(userRemoteDataSoucreProvider));
});

abstract class UserRepository {
  Future<Either<AppError, UserResponseModel>> getUser();
}

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource _userRemoteDataSource;

  UserRepositoryImpl(this._userRemoteDataSource);
  @override
  Future<Either<AppError, UserResponseModel>> getUser() async {
    try {
      final result = await _userRemoteDataSource.getUsers();
      return Right(result);
    } on DioException catch (e) {
      return Left(AppError(message: e.message!));
    }
  }
}
