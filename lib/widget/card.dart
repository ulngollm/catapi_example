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
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 2,
            offset: Offset(0.0, 2.0),
          ),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Container(
              // color: Colors.white,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Stack(
                children: [
                  Container(
                    height: 200,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Detail(link)));
                    },
                    child: FadeInImage.memoryNetwork(
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        placeholder: kTransparentImage,
                        image: link,
                        fit: BoxFit.cover),
                  ),
                ],
              ),
            ),
            Divider(),
            FlatButton(
              child: Text(link),
              textColor: Theme.of(context).primaryColor,
              onPressed: () {
                _launchUrl(link);
              },
            )
          ],
        ),
      ),
    );
  }
}
