abstract class DynamicDAO {
  Future<int> save(dynamic ice);

  remove(int id);

  Future<dynamic> find(int id);

  Future<List<dynamic>> findAll();
}
