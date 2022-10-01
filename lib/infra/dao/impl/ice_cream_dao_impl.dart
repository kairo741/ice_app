// import 'package:ice_app/domain/dto/ice_cream_dto.dart';
// import 'package:ice_app/infra/configuration/connection.dart';
// import 'package:ice_app/infra/dao/dynamic_dao.dart';
// import 'package:sqflite/sqflite.dart';
//
// class IceCreamDAOImpl implements DynamicDAO {
//   Database? _db;
//   var sql;
//
//   @override
//   Future<List<IceCreamDTO>> find(int id) async {
//     _db = await Connection.get();
//     List<Map<String, dynamic>> result = await _db!.query('icecream', where: "id = $id");
//     List<IceCreamDTO> resultList = List.generate(result.length, (index) {
//       var row = result[index];
//       return IceCreamDTO(
//         name: row[IceCreamDTO.NAME],
//         flavour: row[IceCreamDTO.FLAVOUR],
//         type: row[IceCreamDTO.TYPE],
//       );
//     });
//     return resultList;
//   }
//
//   @override
//   Future<List<IceCreamDTO>> findAll() async {
//     _db = await Connection.get();
//     List<Map<String, dynamic>> result = await _db!.query('icecream', limit: 100);
//     List<IceCreamDTO> resultList = List.generate(result.length, (index) {
//       var row = result[index];
//       return IceCreamDTO(
//         name: row[IceCreamDTO.NAME],
//         flavour: row[IceCreamDTO.FLAVOUR],
//         type: row[IceCreamDTO.TYPE],
//       );
//     });
//     return resultList;
//   }
//
//   @override
//   remove(int id) async {
//     _db = await Connection.get();
//     sql = "DELETE FROM icecream WHERE id =? ";
//     _db!.rawDelete(sql, [id]);
//   }
//
//   @override
//   save(dynamic icecream) async {
//     icecream as IceCreamDTO;
//     _db = await Connection.get();
//     if (icecream.id == null) {
//       sql = """INSERT INTO icecream (name, flavour_id, type) VALUES(?,?,?) """;
//       _db!.rawInsert(sql, [icecream.name, icecream.flavour.id, icecream.type]);
//     } else {
//       sql = "UPDATE icecream SET name=?, flavour_id=?, type=? WHERE id=?";
//       await _db!.rawUpdate(sql, [icecream.name, icecream.flavour.id, icecream.type, icecream.id]);
//     }
//   }
// }
