import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class CustomStarRating extends StatelessWidget {
  final int rating;

  const CustomStarRating({
    Key key,
    @required this.rating,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SmoothStarRating(
      rating: rating.toDouble(),
      color: Colors.yellow,
      borderColor: Colors.yellow,
      allowHalfRating: false,
      size: 15.0,
    );
  }
}
