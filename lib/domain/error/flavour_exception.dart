import 'package:ice_app/domain/error/domain_error.dart';

class FlavourException extends DomainError {
  FlavourException() : super('Há mais sabores do que bolas de sorvete');
}
