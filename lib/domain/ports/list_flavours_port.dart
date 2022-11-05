import 'package:ice_app/domain/dto/bought_flavour_dto.dart';

abstract class ListUserFlavoursPort {
  Future<List<BoughtFlavourDTO>> listFlavours();
}
