import 'package:ecodsa_app/components/Buttons/rounded_button.dart';
import 'package:ecodsa_app/components/Containers/image_container.dart';
import 'package:ecodsa_app/components/start_rating.dart';
import 'package:ecodsa_app/models/event.dart';
import 'package:flutter/material.dart';
import 'package:ecodsa_app/style.dart' as Style;
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart' as ds;

class EventCard extends StatefulWidget {
  final Event event;

  const EventCard({Key key, this.event}) : super(key: key);
  @override
  _EventCardState createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  @override
  void initState() {
    super.initState();
    Intl.defaultLocale = "es_MX";
    ds.initializeDateFormatting();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final Event event = widget.event;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Material(
        elevation: 2.0,
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        child: Container(
          height: screenSize.height / 3,
          padding: EdgeInsets.all(10.0),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  // width: 100.0,
                  padding: EdgeInsets.only(right: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: CustomImageContainer(
                          event.logoUrl,
                          // height: 80.0,
                        ),
                      ),
                      Container(
                        height: 10.0,
                      ),
                      Expanded(
                        flex: 2,
                        child: CustomImageContainer(
                          event.imageUrl,
                          // height: 150.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Text(
                          event.type,
                          style: Style.mutedText(fontSize: 10.0),
                        ),
                        CustomStarRating(
                          rating: event.rating,
                        )
                      ],
                    ),
                    Text(
                      event.title.toUpperCase(),
                      style: Style.mutedText(fontSize: 15.0),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                    Container(height: 10.0),
                    Text(
                      _getDates(event.dateStart, event.dateEnd),
                      style: Style.mutedText(fontSize: 10.0),
                    ),
                    Text(
                      event.address,
                      style: Style.mutedText(fontSize: 10.0),
                    ),
                    Container(height: 10.0),
                    Text(
                      event.description,
                      style: Style.mutedText(
                        fontSize: 12.0,
                        weight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.justify,
                      maxLines: 7,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        EcodsaRoundedButton(
                          text: 'Reservaciones',
                          onPressed: () {},
                        ),
                        EcodsaRoundedButton(
                          text: 'Inscripciones',
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getDates(String startDate, String endDate) {
    DateTime start = DateTime.parse(startDate);
    DateTime end = DateTime.parse(endDate);

    final checkFormat = DateFormat('MMMM');
    String lastDay = DateFormat("dd MMMM yyyy").format(end);
    String firstDay;
    if (checkFormat.format(start) == checkFormat.format(end))
      firstDay = DateFormat('dd').format(start);
    else
      firstDay = DateFormat('dd MMMM').format(start);
    return "$firstDay - $lastDay";
  }
}
