import 'package:ecodsa_app/components/Buttons/rounded_button.dart';
// import 'package:ecodsa_app/components/Containers/contact_form_container.dart';
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
              height: 300,
              child: StainContainer(
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Center(
                    child: Text(
                      "${widget.event.description}",
                      style: Style.whiteText(
                        fontSize: 13,
                        weight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                size: 130,
                angle: 80.0,
                top: 140.0,
                right: 50.0,
                left: 250.0,
                bottom: 0.0,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 40.0, bottom: 20.0),
              child: Text(
                "Conectividad\n\nLa ciudad de León cuenta con excelente conectividad aérea y terrestre que convierte a León en uno de los destinos de mejor acceso a nivel nacional e internacional.\n\nLa central de autobuses cuenta con servicios a las principales ciudades del estado, el país y la frontera de la unión americana; localizada a 5 minutos de Polifórum.\n\nEl 53% de los asistentes llegan por vía terrestre.\n\nLeón cuenta con conexiones aéreas vía San Francisco, Los Ángeles, Dallas, Atlanta, Houston, Ciudad de México y Cancún. 231 vuelos semanales 144 vuelos nacionales 87 vuelos internacionales 10 aerolíneas",
                style: Style.mutedText(
                  fontSize: 13,
                  weight: FontWeight.bold,
                ),
              ),
            ),
            // ContactFormContainer(),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20.0),
              child: EcodsaRoundedButton(
                height: 40.0,
                width: 300.0,
                fontSize: 16.0,
                text: "Inscribirse",
                onPressed: () {},
              ),
            ),
            Center(
              child: Text(
                'Consulta nuestro',
                style: Style.mutedText(fontSize: 10.0),
              ),
            ),
            Center(
              child: FlatButton(
                child: Text(
                  "Aviso de privacidad",
                  style: Style.primaryText(
                    fontSize: 10.0,
                    weight: FontWeight.w600,
                  ),
                ),
                onPressed: () => Navigator.pushNamed(context, "/privacy"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
