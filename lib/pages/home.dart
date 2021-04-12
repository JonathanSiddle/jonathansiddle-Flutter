import 'package:flutter/material.dart';
import 'package:jonathansiddle/widgets/HeaderWidget.dart';
import 'package:jonathansiddle/widgets/footer.dart';
import 'package:jonathansiddle/widgets/navigationBar.dart';
import 'package:jonathansiddle/widgets/projectCard.dart';

final projectsKey = GlobalKey();

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          // color: Color.fromARGB(255, 7, 54, 56),
          color: Colors.white,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                  child: NavigationBar(),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 30.0, 30, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [Expanded(child: HeaderWidget())],
                  ),
                ),
                Padding(
                  key: projectsKey,
                  padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text('Projects',
                              style:
                                  TextStyle(fontSize: 64, fontFamily: 'Jost')),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                        child: Wrap(
                          children: [
                            ProjectCard(
                              title: 'Squiddy',
                              description:
                                  'Squiddy is an open source client for Octopus Energy, it allows user to track energy use and view agile prices. You can build the application from source or you can download the application from the Google Play and iOS app stores for £1.99, which contributes to the further development of the applications ',
                              backgroundImage:
                                  'assets/SquiddyWebBackground.png',
                              iconPath: 'assets/squiddyIcon.png',
                              playStoreLink:
                                  'https://play.google.com/store/apps/details?id=app.squiddy&gl=GB',
                              appStoreLink:
                                  'https://apps.apple.com/gb/app/squiddy-for-octopus-energy/id1537614113',
                            ),
                            ProjectCard(
                              title: 'DEFT',
                              description:
                                  'DEFT is an ongoing project at Applied Scientific Technologies. The goal of the project is a hardware an software component that connects an IoT device to traditional lab instruction and turning them into a smart instrument that can be linked to the companion app, which acts a digital log book and can control instruction and capture readings in real-time.',
                              backgroundImage: 'assets/deft-background.png',
                              iconPath: 'assets/deftIcon.png',
                              webLink: 'https://www.appliedst.co.uk/deft',
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(),
                ),
                Footer()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
