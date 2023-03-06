import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:gamewheel/home_setting.dart';
import 'package:gamewheel/page_wheel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final items = <String>[
    'Grogu',
    'Mace Windu',
    'Obi-Wan Kenobi',
  ];
  @override
  Widget build(BuildContext context) {
    var scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
        key: scaffoldKey,
        drawer: _getDrawer(context),
        body: Stack(
          children: <Widget>[
            Center(
              child: PageWheel(
                items: items,
              ),
            ),
            Positioned(
              left: 10,
              top: 20,
              child: IconButton(
                icon: Icon(Icons.menu),
                onPressed: () => scaffoldKey.currentState?.openDrawer(),
              ),
            ),
          ],
        ));
  }

  _getDrawer(BuildContext context) {
    return Drawer(
        child: ListView(
      padding: EdgeInsets.zero,
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Text('Drawer Header'),
        ),
        ListTile(
          title: const Text('Item 1'),
          onTap: () {
            items.add("nugyen");
            Navigator.pop(context);
            setState(() {});
          },
        ),
        ListTile(
          title: const Text('Setting'),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => HomeSetting(
                          items: items,
                        )));
          },
        ),
      ],
    ));
  }
}
