import 'package:ice_app/domain/dto/flavour_dto.dart';

abstract class UserFlavoursDAO {
  List<FlavourDTO> listFlavours();
}
