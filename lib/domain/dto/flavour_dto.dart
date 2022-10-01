// ignore_for_file: constant_identifier_names

class FlavourDTO {
  static const String ID = 'id';
  static const String NAME = 'name';
  static const String COLOR = 'color';
  static const String BASE = 'base';

  int? id;
  String name;
  String color;
  String? base;

  FlavourDTO({this.id, required this.name, required this.color, this.base});
}
