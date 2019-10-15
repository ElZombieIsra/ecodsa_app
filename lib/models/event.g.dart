// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Event _$EventFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const [
    'title',
    'description',
    'image_url',
    'date_start',
    'date_end'
  ]);
  return Event(
    title: json['title'] as String,
    description: json['description'] as String,
    imageUrl: json['image_url'] as String,
    dateStart: json['date_start'] as String,
    dateEnd: json['date_end'] as String,
    address: json['address'] as String,
    logoUrl: json['logo_url'] as String,
    type: json['type'] as String ?? 'Evento',
    rating: json['rating'] as int ?? 5,
  );
}

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'image_url': instance.imageUrl,
      'date_start': instance.dateStart,
      'date_end': instance.dateEnd,
      'address': instance.address,
      'logo_url': instance.logoUrl,
      'type': instance.type,
      'rating': instance.rating,
    };
