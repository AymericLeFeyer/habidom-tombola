import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:habirandom/models/user.dart';
import 'package:habirandom/utils/instances.dart';

class UserController extends GetxController {
  addUser(User user) async {
    addLocalUser(user);
    syncWithFirestore();
  }

  addLocalUser(User user) async {
    List<dynamic> users = getLocalUsers();
    users.add(user);
    Instances.box.write("users", users);
  }

  List<dynamic> getLocalUsers() {
    List<dynamic> users = Instances.box.read("users");
    if (users == null) return [];
    return users;
  }

  void clearUsers() {
    Instances.box.remove("users");
  }

  void syncWithFirestore() {
    var users = getLocalUsers();
    for (User user in users) {
      if (user.email != null) {
        Instances.firestore
            .collection("users")
            .doc(user.email)
            .set(user.toMap());
      }
    }
  }
}
