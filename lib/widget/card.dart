import 'package:flutter/material.dart';
import 'package:http_test/model/cat.dart';
import 'package:http_test/widget/detail.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:url_launcher/url_launcher.dart';

class CatCard extends StatelessWidget {
  final String link;
  final int height;
  final int width;
  CatCard({this.link, this.height, this.width});
  factory CatCard.fromObject(Cat object) =>
      CatCard(link: object.url, height: object.height, width: object.width);

  void _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Stack(children: [
        Center(
          child: CircularProgressIndicator(),
        ),
        Column(
          children: [
            // Image.network(link),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Detail(link)));
              },
              child: FadeInImage.memoryNetwork(
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  placeholder: kTransparentImage,
                  image: link,
                  fit: BoxFit.cover),
            ),
            FlatButton(
              child: Text(link),
              onPressed: () {
                _launchUrl(link);
              },
            )
          ],
        ),
      ]),
    );
  }
}
