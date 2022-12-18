import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_apicall/constant/api_constant.dart';
import 'package:riverpod_apicall/features/unknown/data/model/unknown_repository_model.dart';
import 'package:riverpod_apicall/features/unknown/data/repository/unknown_repository.dart';

import '../../../../core/api_service.dart';

final UnkonownDataRemoteProvider = Provider<UnknowRemoteDataSource>((ref) {
  return UnknownDataSourceImpl(ref.read(apiserviceProvider));
});

abstract class UnknowRemoteDataSource {
  Future<unknowndatamodel> getUnkown();
}

class UnknownDataSourceImpl implements UnknowRemoteDataSource {
  final ApiService _apiService;

  UnknownDataSourceImpl(this._apiService);
  @override
  Future<unknowndatamodel> getUnkown() async {
    final results = await _apiService.getData(endpoint: Apiconstant.unknown);
    return unknowndatamodel.fromMap(results);
  }
}
