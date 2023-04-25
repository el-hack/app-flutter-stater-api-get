import 'package:essaie/app/data/user.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            // TextButton(
            //     onPressed: () async {
            //       // await controller.fetchUsers();
            //     },
            //     child: Text("Get Users")),
            Expanded(
              child: Obx(
                () => controller.load.value
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : controller.users.isEmpty
                        ? const Center(
                            child: Text("Aucun user"),
                          )
                        : ListView.builder(
                            itemCount: controller.users.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(controller.users[index].name!),
                                subtitle: Text(controller.users[index].email!),
                              );
                            },
                          ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
