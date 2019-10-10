import 'package:equatable/equatable.dart';

class New extends Equatable {
  final String title;
  final String description;
  final String imagePath;
  final String type;
  final int rate;

  New(this.title, this.description, this.imagePath, this.type, this.rate);

  @override
  List<Object> get props => [title, description, imagePath, type, rate];
}
