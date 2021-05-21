import 'package:getx_mvvm/model/entity/user.dart';

class UserRepository {
  User getUser(int id) {
    return User(id, 'name_of_user_${id.toString()}');
  }
}
