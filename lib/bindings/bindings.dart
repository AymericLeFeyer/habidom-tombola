import 'package:get/get.dart';
import 'package:habirandom/controllers/users.dart';

class MyBindings implements Bindings {
  // All bindings
  @override
  void dependencies() {
    // User
    Get.lazyPut(() => UserController(), fenix: true);
  }
}
