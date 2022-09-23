import 'package:ice_app/domain/entity/flavour.dart';

class Coverage {
  String name;
  Flavour flavour;
  String? type;

  Coverage({required this.name, required this.flavour, this.type});
}
