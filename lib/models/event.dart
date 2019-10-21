import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'event.g.dart';

@JsonSerializable()
class Event extends Equatable {
  @JsonKey(required: true)
  final String title;
  @JsonKey(required: true)
  final String description;
  @JsonKey(required: true, name: 'image_url')
  final String imageUrl;
  @JsonKey(required: true, name: 'date_start')
  final String dateStart;
  @JsonKey(required: true, name: 'date_end')
  final String dateEnd;

  @JsonKey(nullable: true)
  final String address;
  @JsonKey(name: 'logo_url')
  final String logoUrl;
  @JsonKey(defaultValue: "Evento")
  final String type;
  @JsonKey(defaultValue: 5)
  final int rating;

  Event({
    @required this.title,
    @required this.description,
    @required this.imageUrl,
    @required this.dateStart,
    @required this.dateEnd,
    this.address,
    this.logoUrl,
    this.type,
    this.rating,
  });

  @override
  List<Object> get props => [
        title,
        dateStart,
        dateEnd,
        address,
        description,
        imageUrl,
        logoUrl,
        type,
        rating,
      ];

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
  Map<String, dynamic> toJson() => _$EventToJson(this);
}
