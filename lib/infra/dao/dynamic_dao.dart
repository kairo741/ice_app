abstract class DynamicDAO {
  save(dynamic ice);

  remove(int id);

  Future<dynamic> find(int id);

  Future<List<dynamic>> findAll();
}
