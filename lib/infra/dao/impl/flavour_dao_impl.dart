import 'package:ice_app/domain/dto/flavour_dto.dart';
import 'package:ice_app/infra/configuration/connection.dart';
import 'package:ice_app/infra/dao/interfaces/flavour_dao.dart';
import 'package:ice_app/infra/dao/model/ice_cream_flavour_model.dart';
import 'package:sqflite/sqflite.dart';

class FlavourDAOImpl implements FlavourDAO {
  Database? _db;
  var sql;

  @override
  Future<FlavourDTO> find(int id) async {
    _db = await Connection.get();
    List<Map<String, dynamic>> result = await _db!.query('flavour', where: "id = $id");
    FlavourDTO resultList = List.generate(result.length, (index) {
      var row = result[index];
      return FlavourDTO(
        id: row[FlavourDTO.ID],
        name: row[FlavourDTO.NAME],
        color: row[FlavourDTO.COLOR],
        base: row[FlavourDTO.BASE],
      );
    }).first; // TODO - corrigir
    return resultList;
  }

  @override
  Future<List<FlavourDTO>> findAll() async {
    _db = await Connection.get();
    List<Map<String, dynamic>> result = await _db!.query('flavour', limit: 100);
    List<FlavourDTO> resultList = List.generate(result.length, (index) {
      var row = result[index];
      return FlavourDTO(
        id: row[FlavourDTO.ID],
        name: row[FlavourDTO.NAME],
        color: row[FlavourDTO.COLOR],
        base: row[FlavourDTO.BASE],
      );
    });
    return resultList;
  }

  @override
  remove(int id) async {
    _db = await Connection.get();
    sql = "DELETE FROM flavour WHERE id =? ";
    _db!.rawDelete(sql, [id]);
  }

  @override
  Future<int> save(FlavourDTO flavour) async {
    _db = await Connection.get();
    if (flavour.id == null) {
      sql = """INSERT INTO flavour (name, color, base) VALUES(?,?,?) """;
      return _db!.rawInsert(sql, [flavour.name, flavour.color, flavour.base]);
    } else {
      sql = "UPDATE flavour SET name=?, color=?, base=? WHERE id=?";
      return await _db!.rawUpdate(sql, [flavour.name, flavour.color, flavour.base, flavour.id]);
    }
  }

  @override
  Future<List<FlavourDTO>> listUserFlavours() async {
    _db = await Connection.get();
    List<Map<String, dynamic>> result = await _db!.query('ice_cream_flavour');

    List<IceCreamFlavourModel> modelList = List.generate(result.length, (index) {
      var row = result[index];
      return IceCreamFlavourModel(
          id: row[IceCreamFlavourModel.ID],
          idFlavour: row[IceCreamFlavourModel.ID_FLAVOUR],
          idIceCream: row[IceCreamFlavourModel.ID_ICE_CREAM]);
    });

    List<FlavourDTO> flavours = [];

    for (var element in modelList) {
      flavours.add(await find(element.idFlavour));
    }

    return flavours;
  }
}
