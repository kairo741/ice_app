import 'package:get_it/get_it.dart';
import 'package:ice_app/domain/dto/bought_flavour_dto.dart';
import 'package:ice_app/domain/dto/flavour_dto.dart';
import 'package:ice_app/domain/entity/flavour.dart';
import 'package:ice_app/domain/ports/list_flavours.dart';

class ListIceCream {
  // Flavour flavour;
  late ListUserFlavours listFlavours;

  ListIceCream() {
    listFlavours = GetIt.I.get<ListUserFlavours>();
  }

  listUserFlavours() async {
    List<FlavourDTO> listDTO = await listFlavours.listFlavours();
    formatFlavours(
        listDTO.map((e) => Flavour(id: e.id, color: e.color, name: e.name, base: e.base)).toList());
  }

  List<BoughtFlavourDTO> formatFlavours(List<Flavour> flavours) {
    List<BoughtFlavourDTO> boughtFlavours = [];
    List<Flavour> uniqueFlavours = [];

    flavours.forEach((flavour) {
      var element = uniqueFlavours.where((e) => e.id == flavour.id);
      if (element.isEmpty) {
        uniqueFlavours.add(flavour);
      }
    });

    uniqueFlavours.forEach((element) {
      var flavourQuantity = uniqueFlavours.where((e) => e.id == element.id).length;
      boughtFlavours.add(BoughtFlavourDTO(element.name, element.color, flavourQuantity));
    });

    return boughtFlavours;
  }
}
