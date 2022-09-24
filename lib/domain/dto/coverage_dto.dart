import 'package:ice_app/domain/dto/flavour_dto.dart';

class CoverageDTO {
  String name;
  FlavourDTO flavour;
  String? type;

  CoverageDTO({required this.name, required this.flavour, this.type});
}
