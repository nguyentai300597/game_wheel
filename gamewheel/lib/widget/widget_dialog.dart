import 'package:flutter/material.dart';

class WidgetDialog extends StatelessWidget {
  final List<String> data;
  final int index;
  const WidgetDialog({super.key, required this.data, required this.index});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 200,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        width: MediaQuery.of(context).size.width * 0.8,
        alignment: Alignment.center,
        child: Container(
          child: Text(
            "Giải đã trúng là : ${data[index]}",
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
