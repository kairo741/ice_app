import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ice_app/view/historic/historic_screen.dart';
import 'package:ice_app/view/home_page/home_page.dart';

class HomeWidget extends State<HomePage> {
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
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 30,
          ),
          Center(
            child: Container(
              height: 545,
              width: 370,
              decoration: BoxDecoration(
                  color: Colors.grey[850],
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(
                    width: 3,
                    color: Colors.pink,
                    style: BorderStyle.solid,
                  ),
                  boxShadow: const [
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
                  ]),
            ),
          ),
        ],
      ),
        floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HistoricPage()),
          );
        },
          label: const Text('Pedidos'),
          icon: const Icon(Icons.star),
        backgroundColor: Colors.pink,
    ));

  }
}
