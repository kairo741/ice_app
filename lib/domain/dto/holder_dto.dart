// ignore_for_file: constant_identifier_names

class HolderDTO {
  static const String ID = 'id';
  static const String NAME = 'name';
  static const String AMOUNT_OF_BALL = 'amount_of_ball';

  int? id;
  String name;
  int amountOfBall;

  HolderDTO({this.id, required this.name, required this.amountOfBall});
}
