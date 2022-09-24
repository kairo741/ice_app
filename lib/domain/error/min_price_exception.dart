import 'package:ice_app/domain/error/domain_error.dart';

class MinPriceException extends DomainError {
  MinPriceException() : super('Preço inválido');
}
