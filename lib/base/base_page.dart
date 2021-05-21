import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/base/base_viewmodel.dart';
import 'package:getx_mvvm/main.dart';

abstract class BasePage<VM extends BaseViewModel> extends StatelessWidget {
  final VM viewModel = Get.put(getIt<VM>());
}
