import 'package:ice_app/domain/dto/ice_cream_dto.dart';

abstract class IceCreamDAO {
  Future<int> save(IceCreamDTO dto);

  delete(int id);

  Future<List<IceCreamDTO>> list();

  Future<List<IceCreamDTO>> find(int id);
}
