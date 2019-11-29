import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable()
class Category extends Equatable {
  final int id;
  final String name;
  final int status;

  Category({
    this.id,
    this.name,
    this.status = 1,
  });

  @override
  List<Object> get props => [
        id,
        name,
        status,
      ];

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
