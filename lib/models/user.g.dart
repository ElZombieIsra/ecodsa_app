// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['name']);
  return User(
    email: json['email'] as String,
    name: json['name'] as String,
    id: json['id'] as int,
    profileImage: json['profile_image'] as String,
    password: json['password'] as String,
    accessToken: json['access_token'] as String,
    refreshToken: json['refresh_token'] as String,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
      'profile_image': instance.profileImage,
    };
