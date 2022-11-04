import 'package:ice_app/domain/dto/coverage_dto.dart';

abstract class CoverageDAO {
  Future<int> save(CoverageDTO dto);

  remove(int id);

  Future<List<CoverageDTO>> find(int id);

  Future<List<CoverageDTO>> findAll();
}
