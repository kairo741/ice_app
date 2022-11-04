import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ice_app/view/home_page/home_page.dart';

class HistoricPage extends StatefulWidget {
  const HistoricPage({Key? key}) : super(key: key);

  @override
  State<HistoricPage> createState() => _HistoricPageState();
}

class _HistoricPageState extends State<HistoricPage> {
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
        children:[
          SizedBox(height: 25,),
          Center(
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
        ListView.builder(
        itemCount: 6,
        itemBuilder: (context, index) {
        return Padding(
        padding: const EdgeInsets.all(11.0),
        child: ListTile(
          leading: Icon(Icons.add),
        ));
    })],
      ),
    );
  }
}
