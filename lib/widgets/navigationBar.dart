import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jonathansiddle/config/application.dart';
import 'package:http/http.dart' as http;
import 'package:jonathansiddle/pages/home.dart';
import 'package:jonathansiddle/widgets/responsiveWidget.dart';
import 'package:mailto/mailto.dart';
import 'package:url_launcher/url_launcher.dart';

class NavigationBar extends StatelessWidget {
  final textStyle =
      TextStyle(fontFamily: 'Jost', fontSize: 32.0, color: Colors.grey[700]);

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: horizontalDisplay(),
      mediumScreen: horizontalDisplay(),
      smallScreen: verticalDisplay(),
    );
  }

  Widget verticalDisplay() {
    return ExpandablePanel(
        header: Container(),
        collapsed: Container(),
        expanded: Column(
          children: getButtons(settingsSpacer: false),
        ),
        theme: ExpandableThemeData(
          expandIcon: FontAwesomeIcons.bars,
          collapseIcon: FontAwesomeIcons.bars,
        )
        // tapHeaderToExpand: true,
        // hasIcon: true,
        );
  }

  Widget horizontalDisplay() {
    return Row(
      children: getButtons(),
    );
  }

  List<Widget> getButtons({bool settingsSpacer = true}) {
    return [
      // Padding(
      //   padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
      //   child: TextButton(
      //       onPressed: () async {
      //         var contentUrl =
      //             Uri.https('medium.com', '/feed/@jonathansiddle/');
      //         var content = await http.get(contentUrl);
      //         print(content);
      //       },
      //       child: Container(
      //         constraints: BoxConstraints(minWidth: 0),
      //         child: Text(
      //           'Home',
      //           style: textStyle,
      //         ),
      //       )),
      // ),
      Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
        child: TextButton(
            onPressed: () {
              Scrollable.ensureVisible(projectsKey.currentContext);
            },
            child: Container(
              constraints: BoxConstraints(minWidth: 0),
              child: Text(
                'Projects',
                style: textStyle,
              ),
            )),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
        child: TextButton(
            onPressed: () async {
              if (await canLaunch('https://medium.com/@jonathansiddle')) {
                await launch(
                  'https://medium.com/@jonathansiddle',
                  forceSafariVC: true,
                  forceWebView: true,
                  enableJavaScript: true,
                );
              }
            },
            child: Container(
              constraints: BoxConstraints(minWidth: 0),
              child: Text(
                'Writing',
                style: textStyle,
              ),
            )),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
        child: TextButton(
            onPressed: () async {
              final link = Mailto(to: ['jonathan@siddle.dev']);
              await launch(link.toString());
            },
            child: Container(
              constraints: BoxConstraints(minWidth: 0),
              child: Text(
                'Contact',
                style: textStyle,
              ),
            )),
      ),
      settingsSpacer ? Spacer() : Container(),
      // Padding(
      //   padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
      //   child: IconButton(
      //       icon: Icon(
      //         FontAwesomeIcons.cog,
      //         color: Colors.grey[700],
      //         size: 32,
      //       ),
      //       onPressed: () => print('Tapped Settings')),
      // ),
    ];
  }
}
