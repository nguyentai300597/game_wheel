import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gamewheel/%08provider_model/shared_preferences_provider.dart';
import 'package:gamewheel/%08provider_model/theme_provider.dart';
import 'package:gamewheel/model/user_model.dart';
import 'package:gamewheel/widget/widget_bg.dart';
import 'package:provider/provider.dart';

enum SingingCharacter { vi, en }

class HomeLanguage extends StatefulWidget {
  const HomeLanguage({super.key});

  @override
  State<HomeLanguage> createState() => _HomeLanguageState();
}

class _HomeLanguageState extends State<HomeLanguage> {
  SingingCharacter? _character = SingingCharacter.vi;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getThemeLocal();
  }

  _getThemeLocal() async {
    // final data = await SharedPerferencesLocal.getTheme();
    // print("---${json.e(data)}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WidgetBg(
          child: Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Consumer<ThemeProvider>(
                builder: (context, data, child) {
                  _character =
                      data.isVI ? SingingCharacter.vi : SingingCharacter.en;
                  return Column(
                    children: [
                      ListTile(
                        title: const Text('Vietnamese'),
                        leading: Radio<SingingCharacter>(
                          value: SingingCharacter.vi,
                          groupValue: _character,
                          onChanged: (SingingCharacter? value) {
                            setState(() {
                              _character = value;
                            });
                            Provider.of<ThemeProvider>(context, listen: false)
                                .chanceLocale(isEN: true);
                            //     SharedPerferencesLocal().readData(en: false);
                          },
                        ),
                      ),
                      ListTile(
                        title: const Text('English'),
                        leading: Radio<SingingCharacter>(
                          value: SingingCharacter.en,
                          groupValue: _character,
                          onChanged: (SingingCharacter? value) {
                            setState(() {
                              _character = value;
                            });
                            Provider.of<ThemeProvider>(context, listen: false)
                                .chanceLocale(isEN: false);

                            // SharedPerferencesLocal().readData(en: true);
                          },
                        ),
                      ),
                    ],
                  );
                },
              ))),
    );
  }
}
