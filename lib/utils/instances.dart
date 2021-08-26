import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_storage/get_storage.dart';

class Instances {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  static GetStorage box = GetStorage();
}
