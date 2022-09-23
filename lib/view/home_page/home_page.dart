import 'package:flutter/material.dart';
import 'package:ice_app/view/home_page/home_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => HomeWidget();
}
