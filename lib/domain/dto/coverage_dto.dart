// ignore_for_file: constant_identifier_names
import 'package:ice_app/domain/dto/flavour_dto.dart';

class CoverageDTO {
  static const String ID = 'id';
  static const String NAME = 'name';
  static const String FLAVOUR = 'flavour_id';
  static const String TYPE = 'type';

  int? id;
  String name;
  FlavourDTO flavour;
  String? type;

  CoverageDTO({this.id, required this.name, required this.flavour, this.type});
}
