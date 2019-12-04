import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ecodsa_app/style.dart' as Style;

class EcodsaProfileImageContainer extends StatelessWidget {
  final String url;
  final num size;

  const EcodsaProfileImageContainer(
    this.url, {
    this.size = 200,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          color: Colors.red,
          shape: BoxShape.circle,
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
        width: size.toDouble(),
        height: size.toDouble(),
      ),
      placeholder: (context, url) => CircularProgressIndicator(
        backgroundColor: Style.primaryColor,
      ),
      errorWidget: (context, url, error) => Icon(
        Icons.error,
        color: Style.primaryColor,
      ),
    );
  }
}
