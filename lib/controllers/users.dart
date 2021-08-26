import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:habirandom/models/user.dart';

class UserController {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  static addUser(User user) async {
    firestore.collection("users").add(user.toMap());
  }
}
