import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'Containers/image_container.dart';

class CustomCarousel extends StatefulWidget {
  final List<dynamic> children;
  final Function onPageChanged;
  final double heigth;

  const CustomCarousel({
    Key key,
    @required this.children,
    this.onPageChanged,
    this.heigth,
  }) : super(key: key);
  @override
  _CustomCarouselState createState() => _CustomCarouselState();
}

class _CustomCarouselState extends State<CustomCarousel> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final _threshold = 40;
    final _height = widget.heigth != null ? widget.heigth + _threshold : 400.0;
    return Container(
      padding: EdgeInsets.zero,
      height: _height,
      child: Stack(
        children: [
          CarouselSlider(
            viewportFraction: 1.025,
            enableInfiniteScroll: true,
            pauseAutoPlayOnTouch: Duration(seconds: 5),
            items: widget.children
                .map<Widget>((url) => CustomImageContainer(
                      url,
                      width: screenSize.width - 80.0,
                    ))
                .toList(),
            autoPlay: true,
            aspectRatio: screenSize.aspectRatio,
            height: _height - _threshold,
            onPageChanged: (index) {
              setState(() {
                _current = index;
                if (widget.onPageChanged != null) widget.onPageChanged();
              });
            },
          ),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: widget.children.map<Widget>((child) {
                return Container(
                  width: 8.0,
                  height: 8.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: child == widget.children[_current]
                          ? Color.fromRGBO(0, 0, 0, 0.9)
                          : Color.fromRGBO(0, 0, 0, 0.4)),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
