
import 'package:ice_app/domain/entity/coverage.dart';
import 'package:ice_app/infra/Ice_dao.dart';
import 'package:sqflite/sqflite.dart';

class CoverageDAO implements DynamicDAO{
  Database? _db;
  var sql;


  @override
  Future<List<Coverage>> find(int id) async {
    _db = await Connection.get();
    List<Map<String, dynamic>> result = await _db!.query('ice', where: "id = $id");
    List<Coverage> resultList = List.generate(result.length, (index) {
      var row = result[index];
      return Coverage(
        name: row[Coverage.NAME],
        flavour: row[Coverage.FLAVOUR],
        type: row[Coverage.TYPE],
      );
    });
    return resultList;
  }
}