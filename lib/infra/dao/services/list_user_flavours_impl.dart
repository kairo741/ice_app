import 'package:get_it/get_it.dart';
import 'package:ice_app/domain/dto/flavour_dto.dart';
import 'package:ice_app/domain/ports/list_flavours.dart';
import 'package:ice_app/infra/dao/interfaces/flavour_dao.dart';

class ListUserFlavoursImpl implements ListUserFlavours {
  final _dao = GetIt.I.get<FlavourDAO>();

  @override
  Future<List<FlavourDTO>> listFlavours() async {
    return await _dao.listUserFlavours();
  }
}
