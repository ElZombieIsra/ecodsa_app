import 'package:flutter/material.dart';

class FullHeightContainer extends StatelessWidget {
  final double outsidePadding;
  final Widget child;

  const FullHeightContainer({
    Key key,
    this.outsidePadding = 0.0,
    @required this.child,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
// height without SafeArea
    var padding = MediaQuery.of(context).padding;
    double screenHeight =
        screenSize.height - padding.vertical - kBottomNavigationBarHeight;
    return Container(
      height: screenHeight - (outsidePadding * 2.0),
      child: child,
    );
  }
}
