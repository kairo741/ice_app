import 'package:ice_app/domain/dto/coverage_dto.dart';
import 'package:ice_app/infra/configuration/connection.dart';
import 'package:ice_app/infra/dao/interfaces/coverage_dao.dart';
import 'package:sqflite/sqflite.dart';

class CoverageDAOImpl implements CoverageDAO {
  Database? _db;
  var sql;

  @override
  Future<List<CoverageDTO>> find(int id) async {
    _db = await Connection.get();
    List<Map<String, dynamic>> result = await _db!.query('coverage', where: "id = $id");
    List<CoverageDTO> resultList = List.generate(result.length, (index) {
      var row = result[index];
      return CoverageDTO(
        id: row[CoverageDTO.ID],
        name: row[CoverageDTO.NAME],
        flavour: row[CoverageDTO.FLAVOUR],
        type: row[CoverageDTO.TYPE],
      );
    });
    return resultList;
  }

  @override
  Future<List<CoverageDTO>> findAll() async {
    _db = await Connection.get();
    List<Map<String, dynamic>> result = await _db!.query('coverage', limit: 100);
    List<CoverageDTO> resultList = List.generate(result.length, (index) {
      var row = result[index];
      return CoverageDTO(
        id: row[CoverageDTO.ID],
        name: row[CoverageDTO.NAME],
        flavour: row[CoverageDTO.FLAVOUR],
        type: row[CoverageDTO.TYPE],
      );
    });
    return resultList;
  }

  @override
  remove(int id) async {
    _db = await Connection.get();
    sql = "DELETE FROM coverage WHERE id =? ";
    _db!.rawDelete(sql, [id]);
  }

  @override
  Future<int> save(CoverageDTO coverage) async {
    _db = await Connection.get();
    if (coverage.id == null) {
      sql = """INSERT INTO coverage (name, flavour_id, type) VALUES(?,?,?) """;
      return _db!.rawInsert(sql, [coverage.name, coverage.flavour.id, coverage.type]);
    } else {
      sql = "UPDATE coverage SET name=?, flavour_id=?, type=? WHERE id=?";
      return await _db!.rawUpdate(sql, [coverage.name, coverage.flavour.id, coverage.type, coverage.id]);
    }
  }
}
