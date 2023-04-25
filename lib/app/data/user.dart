import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:essaie/app/model/user_model.dart';

import '../constant/string.dart';

class UserApi {
  final dio = Dio();
  Future<List<UserModel>> getUser() async {
    List<UserModel> users = [];
    try {
      final response = await dio.get("${AppString.baseUrl}/users");
      List data = response.data;
      users = data.map((item) => UserModel.fromJson(item)).toList();
      inspect(users);
      return users;
    } catch (e) {
      log(e.toString());
      return users;
    }
  }
}
