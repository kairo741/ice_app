import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ice_app/view/home_page/home_page.dart';

class HomeWidget extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Icon(
          Icons.icecream,
          color: Colors.pink,
          size: 50,
        ),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 30,),
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
                boxShadow: [ BoxShadow(
                  color: Colors.pink,
                  spreadRadius: 4,
                  blurRadius: 10,
                ),
                  BoxShadow(
                    color: Colors.pink,
                    spreadRadius: -4,
                    blurRadius: 5,
                  )]
              ),


              ),
            ),
          ],
      ),
    );
  }
}
