import 'package:getx_mvvm/base/base_viewmodel.dart';
import 'package:getx_mvvm/controller/last_count_controller.dart';
import 'package:getx_mvvm/model/entity/user.dart';
import 'package:getx_mvvm/repository/user_repository.dart';
import 'package:getx_mvvm/util/get_x_util.dart';

class SecondViewModel extends BaseViewModel {
  final LastCountController lastCountController = GetXUtil.instance();
  final UserRepository userRepository = GetXUtil.instance();
  final List<User> userList = [];

  void addUser(User user) {
    userList.add(user);
    update();
  }
}
