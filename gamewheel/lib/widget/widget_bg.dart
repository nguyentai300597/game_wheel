import 'package:flutter/material.dart';

class WidgetBg extends StatelessWidget {
  final Widget child;
  final Function? onBack;
  const WidgetBg({super.key, required this.child, this.onBack});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 30,
          child: IconButton(
              onPressed: () {
                onBack != null ? onBack?.call() : Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios)),
        ),
        Positioned(top: 30, left: 10, right: 10, bottom: 0, child: child)
      ],
    );
  }
}
