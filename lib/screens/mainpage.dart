import 'package:flutter/material.dart';
import 'package:http_test/view/view.dart';
import 'package:http_test/view/view_model.dart';

class CatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: View(),
      ),
    );
  }
}