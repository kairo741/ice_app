import 'package:ice_app/domain/entity/coverage.dart';
import 'package:ice_app/domain/entity/flavour.dart';
import 'package:ice_app/domain/entity/holder.dart';

class IceCream {
  List<Flavour> flavours;
  List<Coverage> coverages;
  Holder holder;
  int balls;
  double price;

  IceCream(
      {required this.flavours,
      required this.coverages,
      required this.holder,
      required this.balls,
      required this.price});
}
