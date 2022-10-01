import 'package:get_it/get_it.dart';
import 'package:ice_app/domain/entity/flavour.dart';
import 'package:ice_app/domain/ports/list_flavours.dart';

class ListIceCream {
  Flavour flavour;
  late ListUserFlavours listFlavours;

  ListIceCream(this.flavour) {
    listFlavours = GetIt.I.get<ListUserFlavours>();
  }

  formatFlavours() {

  }
}
