import 'dart:math';

import 'package:essaie/app/data/user.dart';
import 'package:essaie/app/model/user_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var users = <UserModel>[].obs;
  var count = 0.obs;
  var load = false.obs;
  @override
  void onInit()async {
    await fetchUsers();
    super.onInit();
  }

  fetchUsers() async {
    load.value = true;
    await UserApi()
        .getUser()
        .then((value) {
          users.value = value;
          load.value = false;
        })
        .catchError((onError) {
          log(onError); 
          users.value = [];
          load.value = false;
        });
  }
}
