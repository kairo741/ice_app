import 'package:ice_app/infra/configuration/database_script.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Connection {
  static Database? _db;

  static Future<Database?> get() async {
    if (_db == null) {
      var path = join(await getDatabasesPath(), "icedatabase");
      deleteDatabase(path);
      _db = await openDatabase(path, version: 1, onCreate: (db, dbVersion) {
        db.execute(createFlavour);
        db.execute(createCoverage);
        db.execute(createHolder);
        db.execute(createIceCream);
        db.execute(createCoverageHolder);
        db.execute(createIceCreamFlavour);
        db.execute(
            """INSERT INTO flavour (name, color, base) VALUES ('Chocolate', 'marrom', 'cacau');""");
        db.execute(
            """INSERT INTO flavour (name, color, base) VALUES ('Morango', 'rosa', 'Morango');""");
        db.execute(
            """INSERT INTO flavour (name, color, base) VALUES ('Doce de leite', 'Amarelo', 'Leite');""");
        db.execute(
            """INSERT INTO coverage (name, id_flavour, type) VALUES ('chocolate',1, 'pegajosa');""");
        db.execute("""INSERT INTO holder (name, amount_of_balls) VALUES ('barquinha', 4);""");
        db.execute(
            """INSERT INTO ice_cream (id_flavour, id_coverage, id_holder, amount_of_balls, price) VALUES
(1, 1, 1, 4, 8.5);""");
        db.execute("""INSERT INTO coverage_ice_cream (id_coverage, id_ice_cream) VALUES (1, 1);""");
        db.execute("""INSERT INTO ice_cream_flavour (id_flavour, id_ice_cream) VALUES (1, 1);""");
        db.execute("""INSERT INTO ice_cream_flavour (id_flavour, id_ice_cream) VALUES (1, 1);""");
        db.execute("""INSERT INTO ice_cream_flavour (id_flavour, id_ice_cream) VALUES (1, 1);""");
        db.execute("""INSERT INTO ice_cream_flavour (id_flavour, id_ice_cream) VALUES (1, 1);""");
        db.execute("""INSERT INTO ice_cream_flavour (id_flavour, id_ice_cream) VALUES (1, 1);""");
        db.execute("""INSERT INTO ice_cream_flavour (id_flavour, id_ice_cream) VALUES (1, 1);""");
        db.execute("""INSERT INTO ice_cream_flavour (id_flavour, id_ice_cream) VALUES (2, 1);""");
        db.execute("""INSERT INTO ice_cream_flavour (id_flavour, id_ice_cream) VALUES (2, 1);""");
        db.execute("""INSERT INTO ice_cream_flavour (id_flavour, id_ice_cream) VALUES (3, 1);""");
        db.execute("""INSERT INTO ice_cream_flavour (id_flavour, id_ice_cream) VALUES (3, 1);""");
        db.execute("""INSERT INTO ice_cream_flavour (id_flavour, id_ice_cream) VALUES (3, 1);""");
      });
    }
    return _db;
  }
}
