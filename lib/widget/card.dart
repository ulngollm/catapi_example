import 'package:flutter/material.dart';

class CatCard extends StatelessWidget {
  final String link;
  CatCard(this.link);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.network(link),
          Text(link)
        ],
      ),
    );
  }
}
