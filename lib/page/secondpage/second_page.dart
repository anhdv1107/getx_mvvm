import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:getx_mvvm/base/base_page.dart';
import 'package:getx_mvvm/controller/last_count_controller.dart';
import 'package:getx_mvvm/model/entity/user.dart';
import 'package:getx_mvvm/page/secondpage/second_viewmodel.dart';

class SecondPage extends BasePage<SecondViewModel> {
  final int randomNumber;

  SecondPage(this.randomNumber);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(randomNumber.toString())),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<LastCountController>(
              builder: (_) {
                return Text(
                  '${viewModel.lastCountController.lastUser.id} ${viewModel.lastCountController.lastUser.name}',
                );
              },
            ),
            Expanded(
              child: GetBuilder<SecondViewModel>(
                builder: (_) {
                  return ListView.builder(
                    itemCount: viewModel.userList.length,
                    itemBuilder: (_, int index) {
                      return Text('${viewModel.userList[index].id} ${viewModel.userList[index].name}');
                    },
                  );
                },
              ),
            ),
            ElevatedButton(
              child: Text('Add new user'),
              onPressed: () {
                User newUser = viewModel.userRepository.getUser(viewModel.userList.length + 1);
                viewModel.addUser(newUser);
                viewModel.lastCountController.editLastUser(newUser);
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.back();
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
