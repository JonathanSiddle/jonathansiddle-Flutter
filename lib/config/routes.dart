import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:jonathansiddle/config/routerHandlers.dart';

class Routes {
  static String root = "/";
  static String contact = "/contact";

  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print("ROUTE WAS NOT FOUND !!!");
      return;
    });
    router.define(root, handler: rootHandler);
    router.define(contact, handler: contactHandler);
  }
}
