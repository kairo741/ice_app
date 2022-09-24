import 'package:ice_app/domain/error/domain_error.dart';

class CoverageLimitException extends DomainError {
  CoverageLimitException() : super('Limite de coberturas excedida');
}
