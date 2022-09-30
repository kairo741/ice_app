import 'package:ice_app/domain/dto/ice_cream_dto.dart';

class IceCreamBuyDTO {
  IceCreamDTO? iceCream;
  int? rate;
  int weight;

  IceCreamBuyDTO({this.iceCream, this.rate, this.weight = 0});
}
