import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:tinycolor/tinycolor.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectCard extends StatefulWidget {
  final String title;
  final String description;
  final String backgroundImage;
  final String iconPath;
  final String playStoreLink;
  final String appStoreLink;
  final String webLink;

  ProjectCard(
      {@required this.title,
      @required this.description,
      @required this.iconPath,
      @required this.backgroundImage,
      this.playStoreLink,
      this.appStoreLink,
      this.webLink});

  @override
  _ProjectCardState createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  Color backgroundColor = Colors.white;
  var projectImageKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    //will workout background colour
    //while setting up image
    _setBackgroundColour();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Container(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(40.0),
                  topRight: const Radius.circular(40.0),
                ),
              ),
              constraints: BoxConstraints(
                maxWidth: 500,
                minWidth: 200,
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 50.0, 15, 0),
                child: Card(
                  // color: Colors.pink,
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  )),
                  elevation: 10,
                  child: Column(
                    children: [
                      ClipPath(
                        clipper: ShapeBorderClipper(
                            shape: BeveledRectangleBorder(
                                borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                        ))),
                        child: Container(
                          constraints: BoxConstraints(maxHeight: 350),
                          color: Colors.transparent,
                          child: Image.asset(
                            this.widget.backgroundImage,
                            fit: BoxFit.fill,
                            height: 350,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          constraints:
                              BoxConstraints(minHeight: 575, maxHeight: 575),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: SelectableText(
                                  this.widget.title,
                                  style: TextStyle(
                                      fontSize: 32, fontFamily: 'Jost'),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: this.widget.webLink != null
                                    ? Linkify(
                                        onOpen: (link) async {
                                          if (await canLaunch(link.url)) {
                                            await launch(link.url);
                                          } else {
                                            throw 'Could not launch $link';
                                          }
                                        },
                                        text: this.widget.webLink)
                                    : Container(),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 10, 10, 10),
                                child: SelectableText(this.widget.description,
                                    // softWrap: true,
                                    style: TextStyle(
                                        fontSize: 24, fontFamily: 'Jost')),
                              ),
                              // Spacer(),
                              appStoreLinksVerticle()
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Material(
                color: Colors.transparent,
                elevation: 10,
                child: Container(
                    constraints: BoxConstraints(maxWidth: 70, maxHeight: 70),
                    child: Image.asset(widget.iconPath)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget appStoreLinksVerticle() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        this.widget.playStoreLink != null
            ? MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () async {
                    if (await canLaunch('${this.widget.playStoreLink}')) {
                      await launch(
                        '${this.widget.playStoreLink}',
                        forceSafariVC: true,
                        forceWebView: true,
                        enableJavaScript: true,
                      );
                    }
                  },
                  child: Image.asset(
                    'assets/playbadge.png',
                    width: 200,
                  ),
                ),
              )
            : Container(),
        this.widget.appStoreLink != null
            ? Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 10, 0),
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () async {
                      if (await canLaunch('${this.widget.appStoreLink}')) {
                        await launch(
                          '${this.widget.appStoreLink}',
                          forceSafariVC: true,
                          forceWebView: true,
                          enableJavaScript: true,
                        );
                      }
                    },
                    child: Image.asset(
                      'assets/appstorebadge.png',
                      // width: 175,
                      height: 55,
                    ),
                  ),
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(),
              )
      ],
    );
  }

  Widget appStoreLinksHorizontal() {
    return Wrap(
      children: [
        this.widget.playStoreLink != null
            ? MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () async {
                    if (await canLaunch('${this.widget.playStoreLink}')) {
                      await launch(
                        '${this.widget.playStoreLink}',
                        forceSafariVC: true,
                        forceWebView: true,
                        enableJavaScript: true,
                      );
                    }
                  },
                  child: Image.asset(
                    'assets/playbadge.png',
                    width: 200,
                  ),
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(),
              ),
        this.widget.appStoreLink != null
            ? Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 10, 0),
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () async {
                      if (await canLaunch('${this.widget.appStoreLink}')) {
                        await launch(
                          '${this.widget.appStoreLink}',
                          forceSafariVC: true,
                          forceWebView: true,
                          enableJavaScript: true,
                        );
                      }
                    },
                    child: Image.asset(
                      'assets/appstorebadge.png',
                      // width: 175,
                      height: 55,
                    ),
                  ),
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(),
              )
      ],
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
