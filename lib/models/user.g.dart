// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['name', 'email']);
  return User(
    json['email'] as String,
    json['name'] as String,
    json['password'] as String,
    accessToken: json['access_token'] as String,
    refreshToken: json['refresh_token'] as String,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
    };
