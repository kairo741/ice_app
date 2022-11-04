// ignore_for_file: constant_identifier_names
class IceCreamFlavourModel {
  static const String ID = 'id';
  static const String ID_FLAVOUR = 'id_flavour';
  static const String ID_ICE_CREAM = 'id_ice_cream';

  int? id;
  int idFlavour;
  int idIceCream;

  IceCreamFlavourModel({this.id, required this.idFlavour, required this.idIceCream});
}
