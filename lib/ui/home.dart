import 'package:flutter/material.dart';
import 'package:habirandom/constants/colors.dart';
import 'package:habirandom/ui/components/texts.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int peopleCount;

  @override
  void initState() {
    super.initState();
    this.peopleCount = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                MyColors.white,
                MyColors.orange,
              ],
            ))),
        SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(children: [
                Image.asset("assets/logo-2.png"),
                Divider(),
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
                SizedBox(height: 150),
                TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(color: MyColors.orange))),
                        backgroundColor:
                            MaterialStateProperty.all(MyColors.white)),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: title("Je participe !",
                          size: 56, color: MyColors.orange),
                    )),
                SizedBox(height: 150),
                title("Déjà ${peopleCount} participants !"),
              ]),
            ),
          ]),
        )
      ]),
    );
  }
}
