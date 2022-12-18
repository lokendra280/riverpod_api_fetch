import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_apicall/features/unknown/data/model/unknown_repository_model.dart';
import 'package:riverpod_apicall/features/users/data/model/user_response_model.dart';
import 'package:riverpod_apicall/features/users/data/repository/user_repository.dart';

import '../../data/repository/unknown_repository.dart';

final UnknownControllerProvider = StateNotifierProvider.autoDispose<
    UnknownController, AsyncValue<unknowndatamodel>>((ref) {
  return UnknownController(ref.read(unknownrepositoryProvider));
});

class UnknownController extends StateNotifier<AsyncValue<unknowndatamodel>> {
  UnknownController(this._unknownRepository)
      : super(const AsyncValue.loading()) {
    fetchunknown();
  }

  final UnknownRepository _unknownRepository;
  fetchunknown() async {
    final result = await _unknownRepository.getunknown();
    result.fold(
      (l) => state = AsyncError(l.message, StackTrace.fromString(l.message)),
      (r) => state = AsyncValue.data(r),
    );
  }
}
