import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecodsa_app/style.dart' as Style;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/landingPage/bloc.dart';
import '../../components/Cards/landing_feature_card.dart';
import '../../components/Containers/image_container.dart';
import '../../components/appBar.dart';
import '../../components/carousel.dart';
import '../../components/footer.dart';
import '../../components/stain.dart';

class IndexScreen extends StatefulWidget {
  @override
  _IndexScreenState createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  final landingBloc = LandingpageBloc();
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
// height without SafeArea
    var padding = MediaQuery.of(context).padding;
    double screenHeight =
        screenSize.height - padding.vertical - kBottomNavigationBarHeight;
    return SafeArea(
      child: BlocProvider(
          builder: (context) => landingBloc,
          child: RefreshIndicator(
            onRefresh: () {
              landingBloc.dispatch(GetLandingPage());
              return Future.delayed(Duration(milliseconds: 1));
            },
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: BlocBuilder(
                bloc: landingBloc,
                builder: (BuildContext ctx, LandingpageState state) {
                  if (state is InitialLandingpageState) {
                    landingBloc.dispatch(GetLandingPage());
                    return Container();
                  } else if (state is LoadingLandingPage) {
                    return Container(
                      height: screenHeight - 120,
                      child: Center(
                        child: CircularProgressIndicator(
                          backgroundColor: Style.primaryColor,
                        ),
                      ),
                    );
                  } else if (state is LoadedLandingPage) {
                    return Column(
                      children: <Widget>[
                        _buildLandingPage(ctx, state.data),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 20.0),
                          width: screenSize.width,
                          child: CarouselSlider(
                            items: state.data["images"]
                                .map<Widget>(
                                  (url) => CustomImageContainer(
                                    url,
                                    width: screenSize.width / 2.3,
                                  ),
                                )
                                .toList(),
                            autoPlay: false,
                            // aspectRatio: (3 / 4),
                            // height: screenSize.height / 5,
                            viewportFraction: 0.46,
                            enlargeCenterPage: false,
                            enableInfiniteScroll: false,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 40.0,
                          ),
                          child: CustomFooter(),
                        ),
                      ],
                    );
                  } else {
                    return Container(
                      height: screenHeight - 120,
                      child: Center(
                        child: Text(state is ErrorLandingPage
                            ? state.error.toString()
                            : "Error"),
                      ),
                    );
                  }
                },
              ),
            ),
          )),
    );
  }

  Widget _buildLandingPage(BuildContext context, Map<String, dynamic> data) {
    final screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 40.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CustomAppBar(),
          CustomCarousel(
            data["images"],
            heigth: screenSize.height / 3,
          ),
          Text(data["title"], style: Style.title1),
          Text(
            data["description"],
            style: Style.mutedText(fontSize: 24.0),
          ),
          Divider(
            height: 40.0,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              CustomImageContainer(
                data["image_description"],
                width: screenSize.width / 3,
                height: screenSize.height / 2.8,
              ),
              Container(
                width: screenSize.width / 2.5,
                child: Text(
                  data["long_description"],
                  style: Style.mutedText(fontSize: 12.0),
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 50.0, 8.0, 10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                LandingFeatureCard(
                  imageUrl: data["features"][0].img,
                  title: data["features"][0].title,
                  description: data["features"][0].description,
                  width: screenSize.width / 3,
                ),
                LandingFeatureCard(
                  imageUrl: data["features"][1].img,
                  title: data["features"][1].title,
                  description: data["features"][1].description,
                  width: screenSize.width / 3,
                ),
              ],
            ),
          ),
          Divider(
            height: 10.0,
          ),
          _buildColumns(context, data["features"]),
        ],
      ),
    );
  }

  Widget _buildColumns(BuildContext context, List features) {
    final screenSize = MediaQuery.of(context).size;
    List<Widget> _rows = [];
    List<Widget> _lastRow = [];

    for (var feature in features) {
      int i = features.indexOf(feature);
      if (!(i == 0 || i == 1)) {
        _lastRow.add(LandingFeatureCard(
          imageUrl: feature.img,
          title: feature.title,
          description: feature.description,
          height: feature.height,
          rating: feature.rating,
          type: feature.type == 1 ? "Experiencia" : "Desconocido",
          width: screenSize.width / 3,
          textWhite: true,
        ));
        if (_lastRow.length == 2) {
          _rows.add(Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: _lastRow,
          ));
          _lastRow = [];
        }
      }
    }
    return Container(
      padding: EdgeInsets.all(8.0),
      child: StainContainer(
        Column(children: _rows),
        left: 250.0,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    landingBloc.dispose();
  }
}
