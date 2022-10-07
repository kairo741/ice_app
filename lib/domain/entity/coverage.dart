import 'package:ice_app/domain/entity/flavour.dart';

class Coverage {
  int? id;
  String name;
  Flavour flavour;
  String? type;

  Coverage({this.id, required this.name, required this.flavour, this.type});
}
