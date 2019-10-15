import 'package:ecodsa_app/components/image_container.dart';
import 'package:ecodsa_app/components/start_rating.dart';
import 'package:flutter/material.dart';
import 'package:ecodsa_app/style.dart' as Style;

class LandingFeatureCard extends StatelessWidget {
  final double width;
  final int height;
  final String imageUrl;
  final String type;
  final int rating;
  final String title;
  final String description;
  final bool textWhite;

  LandingFeatureCard({
    @required this.imageUrl,
    this.title,
    this.description,
    this.width = 150.0,
    this.height = 0,
    this.type = "Experiencia",
    this.rating = 5,
    this.textWhite = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      width: width,
      child: Column(
        children: <Widget>[
          Material(
            elevation: 2.0,
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            child: CustomImageContainer(
              imageUrl,
              height: height == 0 ? width : width * 1.6,
              child: Padding(
                padding: const EdgeInsets.only(left: 5.0, bottom: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(child: Container()),
                    Text(
                      type,
                      style: Style.whiteText(fontSize: 12.0),
                    ),
                    CustomStarRating(rating: rating),
                  ],
                ),
              ),
            ),
          ),
          Container(height: 10.0),
          title != null
              ? Text(
                  title,
                  style: textWhite
                      ? Style.whiteText(
                          fontSize: 12,
                          weight: FontWeight.bold,
                        )
                      : Style.mutedText(
                          fontSize: 12,
                          weight: FontWeight.bold,
                        ),
                  textAlign: TextAlign.start,
                )
              : Container(),
          description != null
              ? Text(
                  description,
                  style: textWhite
                      ? Style.whiteText(
                          fontSize: 12,
                        )
                      : Style.mutedText(
                          fontSize: 12,
                        ),
                )
              : Container(),
        ],
      ),
    );
  }
}
