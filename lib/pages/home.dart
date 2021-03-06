import 'package:flutter/material.dart';
import 'package:jonathansiddle/widgets/HeaderWidget.dart';
import 'package:jonathansiddle/widgets/navigationBar.dart';
import 'package:jonathansiddle/widgets/projectCard.dart';

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
                  padding: const EdgeInsets.all(30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [Expanded(child: HeaderWidget())],
                  ),
                ),
                ProjectCard(
                  title: 'Squiddy',
                  description: 'This is a test description',
                  iconPath: 'assets/squiddyIcon.png',
                ),
                ProjectCard(
                  title: 'DEFT',
                  description: 'This is a test description',
                  iconPath: 'assets/deftIcon.png',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
