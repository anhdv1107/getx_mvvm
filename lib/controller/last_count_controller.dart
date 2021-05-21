import 'package:get/state_manager.dart';
import 'package:getx_mvvm/model/entity/user.dart';

class LastCountController extends GetxController {
  User lastUser = User(0, 'name');

  void editLastUser(User user) {
    lastUser = user;
    update();
  }
}
