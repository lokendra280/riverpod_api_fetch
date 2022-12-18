import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_apicall/core/app_error.dart';
import 'package:riverpod_apicall/core/dio_exception.dart';
import 'package:riverpod_apicall/features/unknown/data/model/unknown_repository_model.dart';

import '../data_source/unknown_remote_data_source.dart';

final unknownrepositoryProvider = Provider<UnknownRepository>((ref) {
  return UnknownRepositiryImpl(ref.read(UnkonownDataRemoteProvider));
});

abstract class UnknownRepository {
  Future<Either<AppError, unknowndatamodel>> getunknown();
}

class UnknownRepositiryImpl implements UnknownRepository {
  final UnknowRemoteDataSource _unknowRemoteDataSource;

  UnknownRepositiryImpl(this._unknowRemoteDataSource);

  @override
  Future<Either<AppError, unknowndatamodel>> getunknown() async {
    try {
      final result = await _unknowRemoteDataSource.getUnkown();
      return Right(result);
    } on DioException catch (e) {
      return Left(AppError(message: e.message!));
    }
  }
}
