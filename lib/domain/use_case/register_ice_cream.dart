import 'package:get_it/get_it.dart';
import 'package:ice_app/domain/entity/ice_cream.dart';
import 'package:ice_app/domain/ports/ice_cream_repository.dart';

class RegisterIceCream {
  IceCream iceCream;
  late IceCreamRepository repository;

  RegisterIceCream(this.iceCream) {
    repository = GetIt.I.get<IceCreamRepository>();

    repository.save(); // TODO - finalizar o save
  }

}
