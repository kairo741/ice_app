import 'package:ice_app/domain/dto/ice_cream_buy_dto.dart';
import 'package:ice_app/domain/dto/ice_cream_dto.dart';
import 'package:ice_app/domain/entity/coverage.dart';
import 'package:ice_app/domain/entity/flavour.dart';
import 'package:ice_app/domain/entity/holder.dart';
import 'package:ice_app/domain/error/ball_limit_exception.dart';
import 'package:ice_app/domain/error/coverage_limit_exception.dart';
import 'package:ice_app/domain/error/flavour_exception.dart';
import 'package:ice_app/domain/error/min_price_exception.dart';

class IceCream {
  late List<Flavour> flavours;
  late List<Coverage> coverages;
  late Holder holder;
  late int amountOfBalls;
  late double price;

  IceCream(
      {required this.flavours,
      required this.coverages,
      required this.holder,
      required this.amountOfBalls,
      required this.price});

  IceCream.create(IceCreamDTO dto) {
    // Valida quantidade de bolas
    if (dto.balls > holder.amountOfBall) throw BallLimitException();
    amountOfBalls = dto.balls;
    holder = Holder(name: dto.holder.name, amountOfBall: dto.holder.amountOfBall);

    // Valida quantidade de bolas por sabor
    if (dto.flavours.length > amountOfBalls) throw FlavourException();
    flavours =
        dto.flavours.map((e) => Flavour(name: e.name, color: e.color, base: e.base)).toList();

    // Valida máximo de coberturas
    if (dto.coverages.length > 2) throw CoverageLimitException();
    coverages = dto.coverages
        .map((e) => Coverage(
            name: e.name,
            flavour: Flavour(name: e.flavour.name, color: e.flavour.color, base: e.flavour.base),
            type: e.type))
        .toList();

    // Valida preço mínimo
    if (dto.price <= 5) throw MinPriceException();
    price = dto.price;
  }

  calcPrice(IceCreamBuyDTO dto) {
    var iceCream = IceCream.create(dto.iceCream!);

    iceCream.price = (dto.weight * 45.99) * ((dto.rate ?? 5) / 50);
  }
}
