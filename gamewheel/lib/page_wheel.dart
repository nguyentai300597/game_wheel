import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';

class PageWheel extends StatefulWidget {
  final List<String>? items;
  const PageWheel({super.key, this.items});

  @override
  State<PageWheel> createState() => _PageWheelState();
}

class _PageWheelState extends State<PageWheel> {
  StreamController<int> selected = StreamController<int>();
  List<String> _items = [];
  final items = <String>[
    '1',
    '2',
    '2',
  ];

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   _items = widget.items ?? items;
  // }

  // @override
  // void didUpdateWidget(covariant PageWheel oldWidget) {
  //   // TODO: implement didUpdateWidget
  //   super.didUpdateWidget(oldWidget);
  //   _items = widget.items ?? items;
  // }

  @override
  Widget build(BuildContext context) {
    _items = widget.items ?? items;
    return _geWheel(_items);
  }

  _geWheel(List<String> items) {
    final dataRandom = Fortune.randomInt(0, items.length);
    return GestureDetector(
      onTap: () {
        setState(() {
          selected.add(
            3,
          );
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: FortuneWheel(
                selected: selected.stream,
                items: [
                  for (var it in _items) FortuneItem(child: Text(it)),
                ],
                onAnimationEnd: () {
                  print("4endd===>${_items[dataRandom]}==$dataRandom");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
