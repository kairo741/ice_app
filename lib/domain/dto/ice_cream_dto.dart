import 'package:ice_app/domain/dto/coverage_dto.dart';
import 'package:ice_app/domain/dto/flavour_dto.dart';
import 'package:ice_app/domain/dto/holder_dto.dart';

class IceCreamDTO {
  List<FlavourDTO> flavours;
  List<CoverageDTO> coverages;
  HolderDTO holder;
  int balls;
  double price;

  IceCreamDTO(
      {required this.flavours,
      required this.coverages,
      required this.holder,
      required this.balls,
      required this.price});
}
