import 'package:get_it/get_it.dart';
import 'package:ice_app/domain/entity/flavour.dart';
import 'package:ice_app/domain/ports/ice_cream_repository.dart';
import 'package:ice_app/domain/ports/list_flavours.dart';
import 'package:ice_app/infra/dao/interfaces/flavour_dao.dart';

class IceCreamRepositoryImpl implements IceCreamRepository {
  // final _dao = GetIt.I.get<FlavourDAO>();

  @override
  delete(int id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  findById(int id) {
    // TODO: implement findById
    throw UnimplementedError();
  }

  @override
  list() {
    // TODO: implement list
    throw UnimplementedError();
  }

  @override
  bool save() {
    // TODO: implement save
    throw UnimplementedError();
  }

}
