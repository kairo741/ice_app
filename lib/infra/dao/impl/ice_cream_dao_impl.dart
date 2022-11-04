import 'package:get_it/get_it.dart';
import 'package:ice_app/domain/dto/ice_cream_dto.dart';
import 'package:ice_app/infra/configuration/connection.dart';
import 'package:ice_app/infra/dao/interfaces/coverage_dao.dart';
import 'package:ice_app/infra/dao/interfaces/flavour_dao.dart';
import 'package:ice_app/infra/dao/interfaces/holder_dao.dart';
import 'package:ice_app/infra/dao/interfaces/ice_cream_dao.dart';
import 'package:sqflite/sqflite.dart';

class IceCreamDAOImpl implements IceCreamDAO {
  final _holderDAO = GetIt.I.get<HolderDAO>();
  final _flavourDAO = GetIt.I.get<FlavourDAO>();
  final _coverageDAO = GetIt.I.get<CoverageDAO>();
  Database? _db;
  var sql;

  @override
  Future<List<IceCreamDTO>> find(int id) async {
    _db = await Connection.get();
    List<Map<String, dynamic>> result = await _db!.query('icecream', where: "id = $id");
    List<IceCreamDTO> resultList = [IceCreamDTO()];
    // for (var element in result) {
    //   var row = result[index];
    //   var holder = (await _holderDAO.find(row[IceCreamDTO.HOLDER])).first;
    //   var flavour = (await _flavourDAO.find(row[IceCreamDTO.FLAVOURS]));
    //   var coverage = (await _flavourDAO.find(row[IceCreamDTO.COVERAGES]));
    //   return IceCreamDTO(
    //     id: row[IceCreamDTO.ID],
    //     holder: holder,
    //     flavour: flavour,
    //     coverages: [coverage],
    //   );
    // }

    return resultList;
  }

  @override
  Future<List<IceCreamDTO>> list() async {
    _db = await Connection.get();
    List<Map<String, dynamic>> result = await _db!.query('icecream', limit: 100);
    List<IceCreamDTO> resultList = [IceCreamDTO()];
    // for (var element in result) {
    //   var row = result[index];
    //   var holder = (await _holderDAO.find(row[IceCreamDTO.HOLDER])).first;
    //   var flavour = (await _flavourDAO.find(row[IceCreamDTO.FLAVOURS]));
    //   var coverage = (await _flavourDAO.find(row[IceCreamDTO.COVERAGES]));
    //   return IceCreamDTO(
    //     id: row[IceCreamDTO.ID],
    //     holder: holder,
    //     flavour: flavour,
    //     coverages: [coverage],
    //   );
    // }

    return resultList;
  }

  @override
  delete(int id) async {
    _db = await Connection.get();
    sql = "DELETE FROM icecream WHERE id =? ";
    _db!.rawDelete(sql, [id]);
  }

  @override
  Future<int> save(IceCreamDTO icecream) async {
    _db = await Connection.get();
    if (icecream.id == null) {
      sql =
          """INSERT INTO icecream (flavour_id, id_coverages, id_holder, balls, price) VALUES(?,?,?,?,?) """;
      return _db!.rawInsert(sql, [
        icecream.flavours!.first.id,
        icecream.coverages!.first.id,
        icecream.holder!.id,
        icecream.balls,
        icecream.price
      ]);
    } else {
      sql =
          "UPDATE icecream SET flavour_id=?, id_coverages=?, id_holder=?, balls=?, price=? WHERE id=?";
      return await _db!.rawUpdate(sql, [
        icecream.flavours!.first.id,
        icecream.coverages!.first.id,
        icecream.holder!.id,
        icecream.balls,
        icecream.id
      ]);
    }
  }
}
