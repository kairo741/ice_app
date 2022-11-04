import 'package:ice_app/domain/dto/holder_dto.dart';
import 'package:ice_app/infra/configuration/connection.dart';
import 'package:ice_app/infra/dao/interfaces/holder_dao.dart';
import 'package:sqflite/sqflite.dart';

class HolderDAOImpl implements HolderDAO {
  Database? _db;
  var sql;

  @override
  Future<List<HolderDTO>> find(int id) async {
    _db = await Connection.get();
    List<Map<String, dynamic>> result = await _db!.query('holder', where: "id = $id");
    List<HolderDTO> resultList = List.generate(result.length, (index) {
      var row = result[index];
      return HolderDTO(
        id: row[HolderDTO.ID],
        name: row[HolderDTO.NAME],
        amountOfBall: row[HolderDTO.AMOUNT_OF_BALL],
      );
    });
    return resultList;
  }

  @override
  Future<List<HolderDTO>> findAll() async {
    _db = await Connection.get();
    List<Map<String, dynamic>> result = await _db!.query('holder', limit: 100);
    List<HolderDTO> resultList = List.generate(result.length, (index) {
      var row = result[index];
      return HolderDTO(
        id: row[HolderDTO.ID],
        name: row[HolderDTO.NAME],
        amountOfBall: row[HolderDTO.AMOUNT_OF_BALL],
      );
    });
    return resultList;
  }

  @override
  remove(int id) async {
    _db = await Connection.get();
    sql = "DELETE FROM holder WHERE id =? ";
    _db!.rawDelete(sql, [id]);
  }

  @override
  Future<int> save(HolderDTO holder) async {
    _db = await Connection.get();
    if (holder.id == null) {
      sql = """INSERT INTO holder (name, amount_of_ball) VALUES(?,?) """;
      return _db!.rawInsert(sql, [holder.name, holder.amountOfBall]);
    } else {
      sql = "UPDATE holder SET name=?, amount_of_ball=? WHERE id=?";
      return await _db!.rawUpdate(sql, [holder.name, holder.amountOfBall, holder.id]);
    }
  }
}
