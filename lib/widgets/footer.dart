import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 129, 199, 238),
      constraints: BoxConstraints(minHeight: 100),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Made with '),
            Icon(
              FontAwesomeIcons.solidHeart,
              size: 22,
            ),
            Text(' by Jonathan Siddle')
          ],
        ),
      ),
    );
  }
}
