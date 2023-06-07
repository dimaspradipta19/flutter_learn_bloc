import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutterr_learn_bloc/ui/home_page.dart';
import 'package:flutterr_learn_bloc/ui/movie_page.dart';

class MenuBottom extends StatefulWidget {
  const MenuBottom({super.key});

  @override
  State<MenuBottom> createState() => _MenuBottomState();
}

class _MenuBottomState extends State<MenuBottom> {
  var selectedIndex = 0;

  final List<Widget> _widgetOptions = [
    const HomePage(),
    const MoviePage(),
  ];

  void _chooseIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "List"),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Object"),
        ],
        onTap: _chooseIndex,
        currentIndex: selectedIndex,
      ),
      body: _widgetOptions.elementAt(selectedIndex),
    );
  }
}
