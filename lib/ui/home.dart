import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habirandom/constants/colors.dart';
import 'package:habirandom/controllers/users.dart';
import 'package:habirandom/ui/components/animatedBackground.dart';
import 'package:habirandom/ui/components/fadeTransition.dart';
import 'package:habirandom/ui/components/texts.dart';
import 'package:habirandom/ui/form.dart';

class HomePage extends StatelessWidget {
  int peopleCount;

  final UserController userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
            height: MediaQuery.of(context).size.height,
            child: AnimatedBackground()),
        SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(children: [
                Container(
                  child: Image.asset(
                    "assets/habidom.png",
                  ),
                ),
                SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/foire.png"),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: title(
                            "Participez au tirage au sort pour tenter de gagner un prix !"),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 100),
                TextButton(
                    onPressed: () {
                      Navigator.push(context, FadeRoute(page: FormPage()));
                    },
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(color: MyColors.orange))),
                        backgroundColor:
                            MaterialStateProperty.all(MyColors.orange)),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: title("Je participe !",
                          size: 56, color: MyColors.white),
                    )),
                SizedBox(height: 100),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width / 3.5,
                        child: Image.asset("assets/1.png")),
                    Container(
                        width: MediaQuery.of(context).size.width / 3.5,
                        child: Image.asset("assets/2.png")),
                    Container(
                        width: MediaQuery.of(context).size.width / 3.5,
                        child: Image.asset("assets/3.png")),
                  ],
                ),
                SizedBox(height: 50),
              ]),
            ),
          ]),
        )
      ]),
    );
  }
}
