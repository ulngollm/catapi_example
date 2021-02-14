import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  @override
  final String _imageSrc;

  const Detail(this._imageSrc);

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        child: Center(
          child: Image.network(_imageSrc),
        ),
      ),
    );
  }
}
