import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:habirandom/bindings/bindings.dart';
import 'package:habirandom/constants/colors.dart';
import 'package:habirandom/ui/home.dart';

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  MyBindings().dependencies();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus &&
              currentFocus.focusedChild != null) {
            FocusManager.instance.primaryFocus.unfocus();
          }
        },
        child: GetMaterialApp(
          initialBinding: MyBindings(),
          title: 'Habirandom',
          theme: ThemeData(
              primarySwatch: Colors.orange,
              fontFamily: "Roboto",
              splashColor: MyColors.orange,
              canvasColor: MyColors.orange,
              hoverColor: MyColors.orange),
          home: HomePage(),
          debugShowCheckedModeBanner: false,
        ));
  }
}
