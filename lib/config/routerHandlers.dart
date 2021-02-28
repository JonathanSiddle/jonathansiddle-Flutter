import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:jonathansiddle/pages/contact.dart';
import 'package:jonathansiddle/pages/home.dart';

var rootHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return Home();
});

var contactHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return Contact();
});
