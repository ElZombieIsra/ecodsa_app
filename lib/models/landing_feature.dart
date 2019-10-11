import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:json_annotation/json_annotation.dart';

part 'landing_feature.g.dart';

@JsonSerializable()
class LandingFeature extends Equatable {
  final String title;
  final String description;
  final String img;
  final int type;
  final int rating;
  final int height;

  LandingFeature({
    @required this.title,
    @required this.description,
    this.img,
    this.type = 1,
    this.rating = 5,
    this.height = 0,
  });

  @override
  List<Object> get props => [title, description, img, type, rating];

  factory LandingFeature.fromJson(Map<String, dynamic> json) =>
      _$LandingFeatureFromJson(json);
  Map<String, dynamic> toJson() => _$LandingFeatureToJson(this);
}
