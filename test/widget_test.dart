import 'package:flutter_test/flutter_test.dart';
import 'package:ice_app/domain/dto/bought_flavour_dto.dart';
import 'package:ice_app/domain/entity/flavour.dart';
import 'package:ice_app/domain/use_case/list_buyed_flavours.dart';

void main() {
  test('Formata Lista de Sabores do usuário', () {
    var listIceCream = ListIceCream();

    var flavoursList = <Flavour>[];
    flavoursList.add(Flavour(id: 1, name: "Chocolate", color: "Marrom", base: "Chocolate"));
    flavoursList.add(Flavour(id: 1, name: "Chocolate", color: "Marrom", base: "Chocolate"));
    flavoursList.add(Flavour(id: 1, name: "Chocolate", color: "Marrom", base: "Chocolate"));
    flavoursList.add(Flavour(id: 2, name: "Morango", color: "Vermelho", base: "Calda de morango"));
    flavoursList.add(Flavour(id: 2, name: "Morango", color: "Vermelho", base: "Calda de morango"));

    var formatted = listIceCream.formatFlavours(flavoursList);

    expect(formatted,
        [BoughtFlavourDTO("Chocolate", "Marrom", 3), BoughtFlavourDTO("Morango", "Vermelho", 2)]);
  });
}
