import 'package:ice_app/domain/dto/holder_dto.dart';

abstract class HolderDAO {
  Future<int> save(HolderDTO holder);

  remove(int id);

  Future<List<HolderDTO>> find(int id);

  Future<List<HolderDTO>> findAll();
}
