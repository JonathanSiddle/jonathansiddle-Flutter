import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavigationBar extends StatelessWidget {
  final textStyle =
      TextStyle(fontFamily: 'Jost', fontSize: 32.0, color: Colors.grey[700]);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
          child: TextButton(
              onPressed: () => print('Tapped home'),
              child: Container(
                constraints: BoxConstraints(minWidth: 0),
                child: Text(
                  'Home',
                  style: textStyle,
                ),
              )),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
          child: TextButton(
              onPressed: () => print('Tapped home'),
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
              onPressed: () => print('Tapped home'),
              child: Container(
                constraints: BoxConstraints(minWidth: 0),
                child: Text(
                  'Writing',
                  style: textStyle,
                ),
              )),
        ),
        Spacer(),
        IconButton(
            icon: Icon(
              FontAwesomeIcons.cog,
              color: Colors.grey[700],
              size: 32,
            ),
            onPressed: () => print('Tapped Settings')),
      ],
    );
  }
}
