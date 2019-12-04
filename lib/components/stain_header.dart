import 'package:ecodsa_app/style.dart' as Style;
import 'package:flutter/material.dart';

class StainHeader extends StatelessWidget {
  final String title;
  final String subtitle;

  const StainHeader({
    Key key,
    @required this.title,
    this.subtitle,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    List<Widget> _children = [
      Text(
        title,
        style: Style.whiteText(
          fontSize: 30.0,
        ),
      ),
    ];
    if (subtitle != null) {
      _children.add(Text(
        subtitle,
        style: Style.mutedText(fontSize: 15.0),
      ));
    }
    return Container(
      transform: Matrix4.translationValues(-20.0, 0.0, 0.0),
      height: 91,
      width: screenSize.width - 50,
      padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.horizontal(right: Radius.circular(50.0)),
        color: Style.primaryColor,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _children,
      ),
    );
  }
}
