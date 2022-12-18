import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_apicall/features/users/data/model/user_response_model.dart';
import 'package:riverpod_apicall/features/users/data/repository/user_repository.dart';

final UserControllerProvider = StateNotifierProvider.autoDispose<UserController,
    AsyncValue<UserResponseModel>>((ref) {
  return UserController(ref.read(userRepositoryProvider));
});

class UserController extends StateNotifier<AsyncValue<UserResponseModel>> {
  UserController(this._userRepository) : super(const AsyncValue.loading()) {
    fetchuser();
  }

  final UserRepository _userRepository;
  fetchuser() async {
    final result = await _userRepository.getUser();
    result.fold(
      (l) => state = AsyncError(l.message, StackTrace.fromString(l.message)),
      (r) => state = AsyncValue.data(r),
    );
  }
}
