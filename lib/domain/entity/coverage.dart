import 'package:ice_app/domain/entity/flavour.dart';

class Coverage {


  static const String NAME = 'name';
  static const String FLAVOUR = 'flavour';
  static const String TYPE = "type";


  String name;
  Flavour flavour;
  String? type;

  Coverage({required this.name, required this.flavour, this.type});
}
