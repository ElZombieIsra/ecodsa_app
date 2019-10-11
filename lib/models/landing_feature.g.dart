// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'landing_feature.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LandingFeature _$LandingFeatureFromJson(Map<String, dynamic> json) {
  return LandingFeature(
    title: json['title'] as String,
    description: json['description'] as String,
    img: json['img'] as String,
    type: json['type'] as int,
    rating: json['rating'] as int,
    height: json['height'] as int,
  );
}

Map<String, dynamic> _$LandingFeatureToJson(LandingFeature instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'img': instance.img,
      'type': instance.type,
      'rating': instance.rating,
      'height': instance.height,
    };
