import 'package:get_it/get_it.dart';
import 'package:ice_app/domain/entity/flavour.dart';
import 'package:ice_app/domain/ports/list_flavours.dart';
import 'package:ice_app/infra/dao/interfaces/flavour_dao.dart';

class ListUserFlavoursImpl implements ListUserFlavours {
  final _dao = GetIt.I.get<FlavourDAO>();

  @override
  List<Flavour> listFlavours() {
    _dao.listUserFlavours();
    return [];
  }
}
