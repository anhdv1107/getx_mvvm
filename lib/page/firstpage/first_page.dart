import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:getx_mvvm/base/base_page.dart';
import 'package:getx_mvvm/controller/last_count_controller.dart';
import 'package:getx_mvvm/page/firstpage/first_viewmodel.dart';
import 'package:getx_mvvm/page/secondpage/second_page.dart';
import 'package:getx_mvvm/util/binding_util.dart';

class FirstPage extends BasePage<FirstViewModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("counter")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<LastCountController>(
              builder: (LastCountController lastCountController) {
                return Text('${lastCountController.lastUser.id} ${lastCountController.lastUser.name}');
              },
            ),
            ElevatedButton(
              child: Text('Next Route'),
              onPressed: () {
                Get.to(() => SecondPage(1), binding: BindingUtil.secondPageBinding());
              },
            ),
          ],
        ),
      ),
    );
  }
}
