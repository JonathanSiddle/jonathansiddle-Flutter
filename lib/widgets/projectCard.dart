import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:tinycolor/tinycolor.dart';

class ProjectCard extends StatefulWidget {
  final String title;
  final String description;
  final String iconPath;
  final String playStoreLink;
  final String appStoreLink;
  final String webLink;

  ProjectCard(
      {@required this.title,
      @required this.description,
      @required this.iconPath,
      this.playStoreLink,
      this.appStoreLink,
      this.webLink});

  @override
  _ProjectCardState createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  Color backgroundColor = Colors.white;

  @override
  void initState() {
    super.initState();
    //will workout background colour
    //while setting up image
    _setBackgroundColour();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(40.0),
          topRight: const Radius.circular(40.0),
        ),
      ),
      constraints: BoxConstraints(
        maxHeight: 700,
        minHeight: 700,
        maxWidth: 500,
        minWidth: 200,
      ),
      child: Card(
        color: Colors.transparent,
        elevation: 10,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              child: Container(
                color: Colors.transparent,
                child: Image.asset('assets/SquiddyWebBackground.png'),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Material(
                elevation: 10,
                shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                )),
                child: Container(
                  constraints: BoxConstraints(maxHeight: 370, minHeight: 370),
                ),
              ),
            ),
            Positioned(
              top: 300,
              left: 215,
              child: Container(
                  constraints: BoxConstraints(maxHeight: 70, maxWidth: 70),
                  child: Image.asset('assets/squiddyIcon.png')),
            )
            // ClipPath(
            //   clipper: DiagonalClipper(),
            //   child: Container(
            //       color: Colors.transparent,
            //       child: Column(
            //         children: [
            //           Padding(
            //             padding: const EdgeInsets.all(30.0),
            //             child: Column(
            //               children: [
            //                 Padding(
            //                   padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
            //                   child: Row(
            //                     children: [
            //                       Text(
            //                         widget.title,
            //                         style: TextStyle(
            //                             fontSize: 48,
            //                             color:
            //                                 TinyColor(backgroundColor).isLight()
            //                                     ? Colors.black
            //                                     : Colors.white,
            //                             fontFamily: 'Jost'),
            //                       )
            //                     ],
            //                   ),
            //                 ),
            //                 Padding(
            //                   padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
            //                   child: Row(
            //                     children: [
            //                       Padding(
            //                         padding: const EdgeInsets.all(15.0),
            //                         child: Container(
            //                             constraints: BoxConstraints(
            //                                 maxWidth: 200, maxHeight: 200),
            //                             child: Image.asset(widget.iconPath)),
            //                       ),
            //                       Expanded(
            //                           child: Text(
            //                         widget.description,
            //                         style: TextStyle(
            //                             color:
            //                                 TinyColor(backgroundColor).isLight()
            //                                     ? Colors.black
            //                                     : Colors.white,
            //                             fontFamily: 'Jost'),
            //                       ))
            //                     ],
            //                   ),
            //                 ),
            //                 Row(
            //                   mainAxisAlignment: MainAxisAlignment.center,
            //                   children: [
            //                     Text('This will be the bottom button section')
            //                   ],
            //                 )
            //               ],
            //             ),
            //           )
            //         ],
            //       )),
            // ),
          ],
        ),
      ),
    );
  }

  Future<void> _setBackgroundColour() async {
    var paletteGenerator = await PaletteGenerator.fromImageProvider(
      Image.asset(widget.iconPath).image,
    );
    print('Got colours!');
    setState(() {
      backgroundColor =
          TinyColor(paletteGenerator.dominantColor.color).lighten(30).color;
      print('Setting card background color');
    });
  }
}

class DiagonalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(size.height, size.height - 150);
    path.lineTo(size.width, size.height - 100);
    path.lineTo(0.0, size.width);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
