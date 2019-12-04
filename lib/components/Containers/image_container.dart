import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ecodsa_app/style.dart' as Style;

class CustomImageContainer extends StatelessWidget {
  final double width;
  final double height;
  final String url;
  final Widget child;

  const CustomImageContainer(
    this.url, {
    this.width,
    this.height,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2.0,
      borderRadius: BorderRadius.all(
        Radius.circular(10.0),
      ),
      child: CachedNetworkImage(
        imageUrl: url,
        imageBuilder: (ctx, imageProvider) => Container(
          child: child,
          width: width,
          height: height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(url),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
        ),
        placeholder: (context, url) => CircularProgressIndicator(
          backgroundColor: Style.primaryColor,
        ),
        errorWidget: (context, url, error) => Icon(
          Icons.error,
          color: Style.primaryColor,
        ),
      ),
    );
  }
}
