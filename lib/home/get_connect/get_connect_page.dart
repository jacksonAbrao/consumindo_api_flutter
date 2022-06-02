// ignore_for_file: avoid_print

import 'package:consumindo_api/home/get_connect/get_connect_controller.dart';
import 'package:consumindo_api/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetConnectPage extends GetView<GetConnectController> {
  const GetConnectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Http Page'),
        ),
        body: controller.obx(
          (state) {
            return ListView.builder(
              itemCount: state.length,
              itemBuilder: (_, index) {
                final UserModel item = state[index];
                return ListTile(title: Text((item.name).toString()));
              },
            );
          },
          onError: (error) {
            print(error);
            return SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(error.toString()),
                  TextButton(
                    onPressed: () => controller.findUsers(),
                    child: const Text('Tentar novamente'),
                  )
                ],
              ),
            );
          },
        ));
  }
}
