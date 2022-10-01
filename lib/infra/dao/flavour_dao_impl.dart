import 'package:ice_app/domain/dto/flavour_dto.dart';
import 'package:ice_app/infra/configuration/connection.dart';
import 'package:ice_app/infra/dao/dynamic_dao.dart';
import 'package:sqflite/sqflite.dart';

class FlavourDAOImpl implements DynamicDAO {
  Database? _db;
  var sql;

  @override
  Future<List<FlavourDTO>> find(int id) async {
    _db = await Connection.get();
    List<Map<String, dynamic>> result = await _db!.query('flavour', where: "id = $id");
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
  save(dynamic flavour) async {
    flavour as FlavourDTO;
    _db = await Connection.get();
    if (flavour.id == null) {
      sql = """INSERT INTO flavour (name, color, base) VALUES(?,?,?) """;
      _db!.rawInsert(sql, [flavour.name, flavour.color, flavour.base]);
    } else {
      sql = "UPDATE flavour SET name=?, color=?, base=? WHERE id=?";
      await _db!.rawUpdate(sql, [flavour.name, flavour.color, flavour.base, flavour.id]);
    }
  }
}
