import 'package:ice_app/domain/error/domain_error.dart';

class BallLimitException extends DomainError {
  BallLimitException() : super('Limite de bolas excedida para o recipiente');
}
