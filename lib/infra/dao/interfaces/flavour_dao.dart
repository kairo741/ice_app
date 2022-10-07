import 'package:ice_app/domain/dto/flavour_dto.dart';

abstract class FlavourDAO {
  save(FlavourDTO flavour);

  remove(int id);

  Future<FlavourDTO> find(int id);

  Future<List<FlavourDTO>> findAll();

  Future<List<FlavourDTO>> listUserFlavours();
}
