import 'package:ecodsa_app/components/appBar.dart';
import 'package:ecodsa_app/components/carousel.dart';
import 'package:flutter/material.dart';
import 'package:ecodsa_app/globals.dart' as globals;
import 'package:ecodsa_app/style.dart' as Style;

class IndexScreen extends StatefulWidget {
  @override
  _IndexScreenState createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CustomAppBar(),
          CustomCarousel(
            heigth: screenSize.height / 3,
            children: <Widget>[
              Image.asset(
                "${globals.kImagesUrl}Evento-empresarial-850x450@3x.png",
                // fit: BoxFit.cover
                // width: 1000.0,
              ),
              Image.asset(
                "${globals.kImagesUrl}evento-empresarial@3x.png",
              ),
              Image.asset(
                "${globals.kImagesUrl}tucuman-eventos-empresariales-sociales@3x.png",
              ),
            ],
          ),
          Text("Bienvenido", style: Style.title1),
          Text(
            "Nuestra amplia gama de servicios nos distingue para hacer de todos sus eventos un éxito",
            style: Style.mutedText(24.0),
          ),
          Divider(
            height: 40.0,
          ),
        ],
      ),
    );
  }
}
