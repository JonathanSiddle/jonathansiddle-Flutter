import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jonathansiddle/responsiveWidget.dart';

class HeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: BottomWaveClipper(),
      child: Card(
        elevation: 15,
        color: Colors.transparent,
        child: ClipPath(
          clipper: BottomWaveClipper(),
          child: Container(
            color: Color.fromARGB(255, 129, 199, 238),
            constraints: BoxConstraints(minHeight: 600),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ResponsiveWidget(
                largeScreen: largeDisplay(),
                smallScreen: smallDisplay(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget largeDisplay() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Material(
            color: Colors.transparent,
            child: Image(image: AssetImage('assets/meAvatar.png'))),
        Padding(
          padding: const EdgeInsets.fromLTRB(15.0, 0, 0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RotationTransition(
                turns: AlwaysStoppedAnimation(-7 / 360),
                child: Center(
                  child: Text(
                    'Hi,  I\'m \n Jonathan Siddle',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 72,
                        color: Colors.white,
                        fontFamily: 'Caveat'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                child: Container(
                  constraints: BoxConstraints(maxWidth: 500),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          'A Software Engineer based in the UK',
                          softWrap: true,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 48,
                              color: Colors.white,
                              fontFamily: 'Jost'),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget smallDisplay() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Material(
            color: Colors.transparent,
            child: Image(image: AssetImage('assets/meAvatar.png'))),
        RotationTransition(
          turns: AlwaysStoppedAnimation(-7 / 360),
          child: Center(
            child: Text(
              'Hi,  I\'m \n Jonathan Siddle',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 72, color: Colors.white, fontFamily: 'Caveat'),
            ),
          ),
        ),
        IntrinsicHeight(
          child: Container(
            constraints: BoxConstraints(minHeight: 200),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: Text(
                'A Software Engineer based in the UK',
                textAlign: TextAlign.center,
                softWrap: true,
                style: TextStyle(
                    fontSize: 48, color: Colors.white, fontFamily: 'Jost'),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class BottomWaveClipper2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.cubicTo(0, 0, size.width, 0, size.width, 0);
    path.cubicTo(size.width, 0, size.width, size.height * .98, size.width,
        size.height * 0.98);
    path.cubicTo(size.width * 0.3, size.height * 1.08, size.width * 0.39,
        size.height * 0.98, 0, size.height * 0.98);
    path.cubicTo(0, size.height * 0.98, 0, 0, 0, 0);
    path.cubicTo(0, 0, 0, 0, 0, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.cubicTo(0, 0, size.width, 0, size.width, 0);
    path.cubicTo(size.width, 0, size.width, size.height * .95, size.width,
        size.height * 0.95);
    path.cubicTo(size.width * 0.3, size.height * 1.05, size.width * 0.39,
        size.height * 0.95, 0, size.height * 0.95);
    path.cubicTo(0, size.height * 0.95, 0, 0, 0, 0);
    path.cubicTo(0, 0, 0, 0, 0, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
