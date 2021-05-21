import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';

class GetXUtil {
  static T instance<T>() => Get.find<T>();
}
