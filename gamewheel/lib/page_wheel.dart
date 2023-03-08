import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:gamewheel/widget/widget_dialog.dart';

class PageWheel extends StatefulWidget {
  final List<String>? items;
  final Function(int)? onCall;
  const PageWheel({super.key, this.items, this.onCall});

  @override
  State<PageWheel> createState() => _PageWheelState();
}

class _PageWheelState extends State<PageWheel> {
  StreamController<int> selected = StreamController<int>();
  List<String> _items = [];
  int value = 0;
  final items = <String>[
    '1',
    '2',
    '2',
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _items = widget.items ?? items;
  }

  @override
  void didUpdateWidget(covariant PageWheel oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    _items = widget.items ?? items;
  }

  @override
  Widget build(BuildContext context) {
    return _geWheel(_items);
  }

  _geWheel(List<String> items) {
    // final dataRandom = Fortune.randomInt(0, _items.length);

    return GestureDetector(
      onTap: () {
        var dataRandom = Random().nextInt(_items.length);
        print("-dataRandom-${dataRandom}");
        value = dataRandom;
        // setState(() {
        selected.add(
          dataRandom,
        );
        //});
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: Transform.rotate(
                angle: 0.15,
                child: FortuneWheel(
                  selected: selected.stream,
                  items: [
                    for (var it in _items) FortuneItem(child: Text(it)),
                  ],
                  onAnimationEnd: () {
                    widget.onCall?.call(value);
                    //  _displayDialog(context, index: dataRandom);
                    //print("4endd===>${_items[dataRandom]}==${dataRandom}");
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
