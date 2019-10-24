import 'package:ecodsa_app/screens/events/eventDetailScreen.dart';
import 'package:ecodsa_app/style.dart' as Style;
import 'package:ecodsa_app/globals.dart' as globals;
import 'package:flutter/material.dart';

import '../../models/event.dart';
import '../Buttons/rounded_button.dart';
import '../Containers/image_container.dart';
import '../start_rating.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    // final screenSize = MediaQuery.of(context).size;
    final Event event = widget.event;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => EventDetailScreen(event)),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10.0),
        child: Material(
          elevation: 2.0,
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          child: Container(
            height: 225,
            padding: EdgeInsets.all(10.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 3,
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
                  flex: 5,
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
                        style: Style.mutedText(fontSize: 12.0),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      Container(height: 10.0),
                      Text(
                        globals.formatDates(event.dateStart, event.dateEnd),
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
                          fontSize: 10.0,
                          weight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.justify,
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          EcodsaRoundedButton(
                            text: 'Reservaciones',
                            height: 10.0,
                            fontSize: 10.0,
                            onPressed: () {},
                          ),
                          EcodsaRoundedButton(
                            text: 'Inscripciones',
                            height: 10.0,
                            fontSize: 10.0,
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
      ),
    );
  }
}
