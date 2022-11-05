import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:ice_app/domain/dto/bought_flavour_dto.dart';
import 'package:ice_app/domain/ports/list_flavours_port.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final _flavourPort = GetIt.I.get<ListUserFlavoursPort>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey[850],
        centerTitle: true,
        title: const Icon(
          Icons.icecream,
          color: Colors.pink,
          shadows: [
            BoxShadow(
              color: Colors.pink,
              spreadRadius: 4,
              blurRadius: 10,
            ),
            BoxShadow(
              color: Colors.pink,
              spreadRadius: -4,
              blurRadius: 5,
            )
          ],
          size: 50,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 25,
          ),
          const Center(
            child: Text(
              'Histórico de Pedidos',
              style: TextStyle(
                fontSize: 25,
                color: Colors.pink,
                shadows: [
                  BoxShadow(
                    color: Colors.pink,
                    spreadRadius: 4,
                    blurRadius: 10,
                  ),
                  BoxShadow(
                    color: Colors.pink,
                    spreadRadius: -4,
                    blurRadius: 5,
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: FutureBuilder(
              future: _flavourPort.listFlavours(),
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                  List<BoughtFlavourDTO> history = snapshot.data!;
                  return ListView.builder(
                    itemCount: history.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                        const Icon(Icons.icecream),
                        Text(
                          "Sabor: ${history[index].name}",
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text("Saboreado: ${history[index].quantity}x",
                            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
                      ]),
                    ),
                  );
                }
                return const CircularProgressIndicator();
              },
            ),
          )
        ],
      ),
    );
  }
}
