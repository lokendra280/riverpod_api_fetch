import 'dart:convert';

import 'package:riverpod_apicall/constant/app_constant.dart';

class UserResponseModel {
  final int page;
  final int totalpages;
  final List<UserModel> data;
  UserResponseModel({
    required this.page,
    required this.totalpages,
    required this.data,
  });

  factory UserResponseModel.fromMap(Map<String, dynamic> map) {
    return UserResponseModel(
      page: map['page']?.toInt() ?? 0,
      totalpages: map['total_pages']?.toInt() ?? 0,
      data:
          List.from(map['data']).map((obj) => UserModel.fromMap(obj)).toList(),
    );
  }
}

class UserModel {
  final int id;
  final String first_name;
  final String last_name;
  final String email;
  final String avatar;
  UserModel({
    required this.id,
    required this.first_name,
    required this.last_name,
    required this.email,
    required this.avatar,
  });

  // Map<String, dynamic> toMap() {
  //   return {
  //     'id': id,
  //     'firstName': firstName,
  //     'lastName': lastName,
  //     'email': email,
  //     'avatar': avatar,
  //   };
  // }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id']?.toInt() ?? 0,
      first_name: map['first_name'] ?? '',
      last_name: map['last_name'] ?? '',
      email: map['email'] ?? '',
      avatar: map['avatar'] ?? AppConstant.placeholderimage,
    );
  }

  // String toJson() => json.encode(toMap());

  // factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));
}
