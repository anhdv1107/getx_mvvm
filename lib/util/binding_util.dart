import 'package:get/get.dart';
import 'package:getx_mvvm/repository/user_repository.dart';

class BindingUtil {
  static BindingsBuilder secondPageBinding() {
    return BindingsBuilder(() {
      Get.lazyPut<UserRepository>(() => UserRepository());
    });
  }
}
