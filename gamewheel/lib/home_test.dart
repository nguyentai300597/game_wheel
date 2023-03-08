import 'package:flutter/material.dart';
import 'package:gamewheel/%08provider_model/main_model.dart';
import 'package:gamewheel/%08provider_model/theme_provider.dart';
import 'package:provider/provider.dart';

class HomeTest extends StatefulWidget {
  const HomeTest({super.key});

  @override
  State<HomeTest> createState() => _HomeTestState();
}

class _HomeTestState extends State<HomeTest> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MainModel(),
      child: Consumer<MainModel>(
        builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            title: Text("widget.title"),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '${model.counter}',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              // Provider.of<MainModel>(context, listen: false).incrementCounter();

              Provider.of<ThemeProvider>(context, listen: false).toggleMode();

              // _darkModeEnabled ?isOn=1 : isOn =0;
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
