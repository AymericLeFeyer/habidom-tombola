import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:habirandom/constants/colors.dart';
import 'package:habirandom/ui/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
        child: MaterialApp(
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
