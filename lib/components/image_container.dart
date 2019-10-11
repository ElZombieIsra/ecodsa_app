import 'package:flutter/material.dart';

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
      child: Container(
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
    );
  }
}
