import 'package:ecodsa_app/components/Containers/image_container.dart';
import 'package:ecodsa_app/components/appBar.dart';
import 'package:ecodsa_app/components/carousel.dart';
import 'package:ecodsa_app/components/stain.dart';
import 'package:ecodsa_app/components/start_rating.dart';
import 'package:ecodsa_app/models/event.dart';
import 'package:flutter/material.dart';
import 'package:ecodsa_app/style.dart' as Style;
import 'package:ecodsa_app/globals.dart' as globals;

class EventDetailScreen extends StatefulWidget {
  final Event event;

  const EventDetailScreen(
    this.event, {
    Key key,
  }) : super(key: key);
  @override
  _EventDetailScreenState createState() => _EventDetailScreenState();
}

class _EventDetailScreenState extends State<EventDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
          children: <Widget>[
            CustomAppBar(),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        widget.event.type,
                        style: Style.primaryText(fontSize: 23),
                      ),
                      Text(
                        "Inscripciones y reservaciones",
                        style: Style.primaryText(fontSize: 14),
                      )
                    ],
                  ),
                  CustomStarRating(
                    rating: widget.event.rating,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomImageContainer(
                widget.event.logoUrl,
                height: screenSize.height / 3,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                widget.event.type,
                style: Style.mutedText(fontSize: 12),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: SelectableText(
                widget.event.title,
                style: Style.mutedText(fontSize: 16),
              ),
            ),
            Container(
              child: CustomCarousel(
                [widget.event.imageUrl],
                heigth: screenSize.height / 4,
              ),
              margin: EdgeInsets.symmetric(vertical: 10.0),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10.0),
              child: Center(
                child: Column(
                  children: <Widget>[
                    Text(
                      globals.formatDates(
                        widget.event.dateStart,
                        widget.event.dateEnd,
                      ),
                      style: Style.primaryText(fontSize: 24),
                    ),
                    Text(
                      widget.event.address,
                      style: Style.primaryText(fontSize: 26),
                    ),
                  ],
                ),
              ),
            ),
            // TODO: Change stain to fixed image
            Container(
              margin: EdgeInsets.symmetric(vertical: 30.0),
              // height: screenSize.height / 1.5,
              child: StainContainer(
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      "${widget.event.description} \n\n¿A quién va dirigido este evento? \n\n\t\tIngenieros civiles\n\t\tArquitectos\n\t\tDesarrolladores inmobiliarios\n\t\tDiseñadores estructurales\n\t\tConstructores\n\t\tEmpresarios industriales del concreto\n\t\tSector público\n\t\tProveedores especializados\n\t\tMaestros y estudiantes",
                      style: Style.whiteText(
                        fontSize: 13,
                        weight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                size: screenSize.height / 3.3,
                angle: 65.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
