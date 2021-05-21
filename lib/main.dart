import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/instance_manager.dart';
import 'package:get_it/get_it.dart';
import 'package:getx_mvvm/controller/last_count_controller.dart';
import 'package:getx_mvvm/page/firstpage/first_page.dart';
import 'package:getx_mvvm/page/firstpage/first_viewmodel.dart';
import 'package:getx_mvvm/page/secondpage/second_viewmodel.dart';

final getIt = GetIt.instance;

void main() {
  setupGetIt();
  setupGetX();
  runApp(MyApp());
}

void setupGetIt() {
  // register all viewmodel here
  // generic instances were needed for viewmodel dependencies injection
  // Get.put(getIt<VM>())
  getIt..registerFactory(() => FirstViewModel())..registerFactory(() => SecondViewModel());

  // register all common controller here
  // controller instances were needed for controller dependencies injection
  // Get.lazyPut(() => getIt<LastCountController>());
  getIt.registerLazySingleton(() => LastCountController());
}

void setupGetX() {
  Get.lazyPut(() => getIt<LastCountController>(), fenix: true);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return FirstPage();
  }
}
