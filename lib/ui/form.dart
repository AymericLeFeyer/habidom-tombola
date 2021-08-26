import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:habirandom/constants/colors.dart';
import 'package:habirandom/controllers/users.dart';
import 'package:habirandom/models/user.dart';
import 'package:habirandom/ui/components/animatedBackground.dart';
import 'package:habirandom/ui/components/texts.dart';

class FormPage extends StatelessWidget {
  int peopleCount;
  ScrollController controller = new ScrollController();
  Rx<bool> scrollToBottom = true.obs;
  String firstname;
  String lastname;
  String email;
  String phone;
  String project;

  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.find<UserController>();

    controller.addListener(() {
      if ((controller.position.pixels < 200)) {
        scrollToBottom.value = true;
      } else if (controller.position.pixels > 200) {
        scrollToBottom.value = false;
      }
    });

    return Scaffold(
      body: Stack(children: [
        Container(
            height: MediaQuery.of(context).size.height,
            child: AnimatedBackground()),
        SingleChildScrollView(
          controller: controller,
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    child: Image.asset(
                      "assets/habidom.png",
                    ),
                  ),
                ),
                SizedBox(height: 50),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Form(
                  child: Column(
                children: [
                  subTitle(subtitle: "Qui êtes-vous ?"),
                  formField(
                      label: "Nom",
                      icon: Icon(Icons.person, size: 40),
                      onChanged: (value) {
                        lastname = value;
                      }),
                  formField(
                      label: "Prénom",
                      icon: Icon(Icons.person, size: 40),
                      onChanged: (value) {
                        firstname = value;
                      }),
                  subTitle(subtitle: "Comment vous contacter ?"),
                  formField(
                      label: "Email",
                      icon: Icon(Icons.mail, size: 40),
                      onChanged: (value) {
                        email = value;
                      }),
                  formField(
                      label: "Téléphone",
                      icon: Icon(Icons.phone, size: 40),
                      onChanged: (value) {
                        phone = value;
                      }),
                  subTitle(subtitle: "Un projet à nous faire part ?"),
                  formField(
                    label: "Projet",
                    maxLines: 5,
                    minLines: 5,
                    onChanged: (value) {
                      project = value;
                    },
                    icon: Icon(Icons.folder, size: 40),
                  ),
                  subTitle(subtitle: "C'est prêt ? On envoie !"),
                  Text(
                    "En participant à ce concours, vous autorisez la société Habidom à utiliser vos données pour vous contacter par la suite.",
                    style: TextStyle(fontSize: 32),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  TextButton(
                      onPressed: () {
                        if (email != null && email != "") {
                          userController.addUser(new User(
                              email: email,
                              firstname: firstname,
                              lastname: lastname,
                              project: project,
                              phone: phone));
                          email = "";
                          firstname = "";
                          lastname = "";
                          phone = "";
                          project = "";
                          Navigator.pop(context);
                        } else {
                          Get.snackbar("Veuillez entrer un email", "");
                        }
                      },
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side:
                                          BorderSide(color: MyColors.orange))),
                          backgroundColor:
                              MaterialStateProperty.all(MyColors.white)),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: title("Je participe !",
                            size: 56, color: MyColors.orange),
                      )),
                  SizedBox(
                    height: 50,
                  ),
                ],
              )),
            )
          ]),
        )
      ]),
      floatingActionButton: Container(
        width: 100,
        height: 100,
        child: Obx(() => FittedBox(
              child: FloatingActionButton(
                child: Icon(
                  scrollToBottom.value
                      ? Icons.arrow_downward
                      : Icons.arrow_upward,
                  color: Colors.white,
                  size: 42,
                ),
                onPressed: () {
                  controller.animateTo(
                    scrollToBottom.value ? 800 : 0.0,
                    curve: Curves.easeOut,
                    duration: const Duration(milliseconds: 500),
                  );
                },
              ),
            )),
      ),
    );
  }
}

Widget formField(
    {label, icon, onChanged, bottomSpace = true, maxLines, minLines}) {
  return Column(
    children: [
      TextFormField(
        style: TextStyle(fontSize: 42),
        minLines: minLines,
        maxLines: maxLines,
        onChanged: onChanged,
        autocorrect: false,
        decoration: InputDecoration(
          prefixIcon: icon,
          fillColor: MyColors.white,
          filled: true,
          labelText: label,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(16))),
        ),
      ),
      SizedBox(
        height: bottomSpace ? 50 : 0,
      ),
    ],
  );
}

Widget subTitle({subtitle}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 30.0),
    child: Row(
      children: [
        Expanded(
          child: new Container(
              margin: const EdgeInsets.only(left: 10.0, right: 20.0),
              child: Divider(
                color: Colors.black,
                height: 36,
              )),
        ),
        Text(
          subtitle,
          style: TextStyle(fontSize: 40),
        ),
        Expanded(
          child: new Container(
              margin: const EdgeInsets.only(left: 20.0, right: 10.0),
              child: Divider(
                color: Colors.black,
                height: 36,
              )),
        ),
      ],
    ),
  );
}
