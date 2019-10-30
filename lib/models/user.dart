import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends Equatable {
  @JsonKey(nullable: true)
  final int id;
  @JsonKey(required: true)
  final String name;
  @JsonKey(nullable: true)
  final String email;
  @JsonKey(nullable: true)
  final String password;
  @JsonKey(nullable: true, name: 'access_token')
  final String accessToken;
  @JsonKey(nullable: true, name: 'refresh_token')
  final String refreshToken;
  @JsonKey(nullable: true, name: 'profile_image')
  final String profileImage;

  User({
    this.email,
    this.name,
    this.id,
    this.profileImage,
    this.password,
    this.accessToken,
    this.refreshToken,
  });

  @override
  List<Object> get props => [
        this.email,
        this.name,
        this.password,
        this.accessToken,
        this.refreshToken,
      ];

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
