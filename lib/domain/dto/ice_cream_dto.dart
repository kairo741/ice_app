// ignore_for_file: constant_identifier_names

import 'package:ice_app/domain/dto/coverage_dto.dart';
import 'package:ice_app/domain/dto/flavour_dto.dart';
import 'package:ice_app/domain/dto/holder_dto.dart';

class IceCreamDTO {
  static const String ID = 'id';
  static const String FLAVOURS = 'id_flavours';
  static const String COVERAGES = 'id_coverages';
  static const String HOLDER = 'id_holder';
  static const String BALLS = 'amount_of_balls';
  static const String PRICE = 'price';

  int? id;
  List<FlavourDTO>? flavours;
  List<CoverageDTO>? coverages;
  HolderDTO? holder;
  int? balls;
  double? price;

  IceCreamDTO({this.id, this.flavours, this.coverages, this.holder, this.balls, this.price});
}
