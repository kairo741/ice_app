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
  int? id;
  late List<Flavour> flavours;
  late List<Coverage> coverages;
  late Holder holder;
  late int amountOfBalls;
  late double price;

  IceCream(
      {this.id,
      required this.flavours,
      required this.coverages,
      required this.holder,
      required this.amountOfBalls,
      required this.price});

  IceCream.create(IceCreamDTO dto) {
    // Valida quantidade de bolas
    validateBallsQnt(dto);

    // Valida quantidade de bolas por sabor
    validateBallsByFlavour(dto);

    // Valida máximo de coberturas
    validadeMaxCoverage(dto);

    // Valida preço mínimo
    validateMinPrice(dto);
  }

  validateBallsQnt(IceCreamDTO dto) {
    if (dto.balls! > holder.amountOfBall) throw BallLimitException();
    amountOfBalls = dto.balls!;
    holder = Holder(name: dto.holder!.name, amountOfBall: dto.holder!.amountOfBall);
  }

  validadeMaxCoverage(IceCreamDTO dto) {
    if (dto.coverages!.length > 2) throw CoverageLimitException();
    coverages = dto.coverages!
        .map((e) => Coverage(
            name: e.name,
            flavour: Flavour(name: e.flavour.name, color: e.flavour.color, base: e.flavour.base),
            type: e.type))
        .toList();
  }

  validateMinPrice(IceCreamDTO dto) {
    if (dto.price! <= 5) throw MinPriceException();
    price = dto.price!;
  }

  validateBallsByFlavour(IceCreamDTO dto) {
    if (dto.flavours!.length > amountOfBalls) throw FlavourException();
    flavours =
        dto.flavours!.map((e) => Flavour(name: e.name, color: e.color, base: e.base)).toList();
  }

  calcPrice(IceCreamBuyDTO dto) {
    var iceCream = IceCream.create(dto.iceCream!);

    iceCream.price = (dto.weight * 45.99) * ((dto.rate ?? 5) / 50);
  }
}
