import 'package:flutter/material.dart';
import 'package:http_test/view/view.dart';
import 'package:http_test/view/view_model.dart';

class CatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFF56CCF2),
      ),
      home: Scaffold(
        body: View(),
      ),
    );
  }
}