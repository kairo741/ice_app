import 'package:ice_app/infra/configuration/database_script.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Connection {
  static Database? _db;

  static Future<Database?> get() async {
    if (_db == null) {
      var path = join(await getDatabasesPath(), "stockDatabase");
      // deleteDatabase(path);
      _db = await openDatabase(path, version: 1, onCreate: (db, dbVersion) {
        db.execute(createFlavour);
        db.execute(createCoverage);
        db.execute(createHolder);
        db.execute(createIceCream);
      });
    }
    return _db;
  }
}
