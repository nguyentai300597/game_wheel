import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gamewheel/%08provider_model/shared_preferences_provider.dart';
import 'package:gamewheel/%08provider_model/theme_provider.dart';
import 'package:gamewheel/home_language.dart';

import 'package:gamewheel/home_setting.dart';
import 'package:gamewheel/page_wheel.dart';
import 'package:gamewheel/widget/widget_dialog.dart';
import 'package:provider/provider.dart';

import 'generated/l10n.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with KeepAliveParentDataMixin {
  List<String> items = <String>[
    '0',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //   _readLocal();
  }

  _readLocal() async {
    final data = await SharedPerferencesLocal().readData();
    if (data != null) {
      Provider.of<ThemeProvider>(context, listen: false)
          .toggleMode(light: data.dark);
    }
  }

  @override
  void didUpdateWidget(covariant HomePage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    //_readLocal();
  }

  //bool _themeDart = true;
  final ValueNotifier _themeDart = ValueNotifier(true);
  @override
  Widget build(BuildContext context) {
    var scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
        key: scaffoldKey,
        drawer: _getDrawer(context),
        body: Stack(
          children: <Widget>[
            // Container(
            //   width: double.infinity,
            //   height: MediaQuery.of(context).size.height,
            //   child: Image.asset(
            //     "assets/images/Numbers.png",
            //     fit: BoxFit.fill,
            //   ),
            // ),
            Consumer<ThemeProvider>(
              builder: (context, value, child) {
                return Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height,
                  child: Image.asset(
                    value.mode == ThemeMode.light
                        ? "assets/images/Numbers.png"
                        : "assets/images/Numbers_dart.png",
                    fit: BoxFit.fill,
                  ),
                );
              },
            ),
            Align(
              // top: 20,
              // right: 20,
              // left: 20,
              alignment: Alignment.center,

              child: Container(
                  width: double.infinity,
                  height: 340,
                  child: Stack(
                    children: [
                      PageWheel(
                        items: items,
                        onCall: (int index) async {
                          //  _displayDialog(context, index: index);
                        },
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                            height: 50,
                            width: 30,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/poinwheel.png")),
                            )),
                      )
                    ],
                  )),
            ),
            Positioned(
              left: 10,
              top: 20,
              child: IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () => scaffoldKey.currentState?.openDrawer(),
              ),
            ),
          ],
        ));
  }

  _displayDialog(BuildContext context, {int index = 0}) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Container(
              height: 100,
              alignment: Alignment.center,
              child: Text(
                "Giải đã trúng là : ${items[index]}",
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            actions: [
              InkWell(
                onTap: () => Navigator.pop(context),
                child: Text("Close"),
              )
            ],
          );
        });
  }

  _getDrawer(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(bottomRight: Radius.circular(35)),
      child: Drawer(
          //shape:ShapeBorder()
          child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/wheel.png"),
                    fit: BoxFit.fill)),
            child: Text(""),
          ),
          ListTile(
            title: Text(S.of(context).edit),
            onTap: () async {
              final data = await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => HomeSetting(
                            items: items,
                          )));

              if (data.isNotEmpty) {
                items = data;
                setState(() {});
                items.forEach((element) {
                  print("===>${element}");
                });
              }
            },
          ),
          // ListTile(
          //   title: Text(S.of(context).hello),
          //   onTap: () {},
          // ),
          // Consumer<ThemeProvider>(
          //   builder: (context, value, child) {
          //     return Padding(
          //       padding: const EdgeInsets.only(left: 15, right: 10),
          //       child: Container(
          //         width: double.infinity,
          //         child: Row(
          //           children: [
          //             Text(S.of(context).language),
          //             Expanded(
          //               child: Row(
          //                 mainAxisAlignment: MainAxisAlignment.end,
          //                 children: [
          //                   Text("vi"),
          //                   Container(
          //                       width: 100,
          //                       child: SwitchListTile(
          //                         value: !value.isVI,
          //                         onChanged: (bool? value) {
          //                           Provider.of<ThemeProvider>(context,
          //                                   listen: false)
          //                               .chanceLocale();
          //                         },
          //                       )),
          //                   Text("en"),
          //                 ],
          //               ),
          //             )
          //           ],
          //         ),
          //       ),
          //     );
          //   },
          // ),
          ListTile(
            title: Text(S.of(context).Theme),
            trailing: Container(
              width: 100,
              child: ValueListenableBuilder(
                valueListenable: _themeDart,
                builder: (context, value, child) {
                  return SwitchListTile(
                    value: _themeDart.value,
                    onChanged: (bool? value) async {
                      _themeDart.value = !_themeDart.value;
                      Provider.of<ThemeProvider>(context, listen: false)
                          .toggleMode();

                      //  await SharedPerferencesLocal().readData(dark: value);
                    },
                  );
                },
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            title: Text(S.of(context).language),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeLanguage(),
                  ));
            },
          ),
        ],
      )),
    );
  }

  @override
  void detach() {
    // TODO: implement detach
  }

  @override
  // TODO: implement keptAlive
  bool get keptAlive => true;
}
