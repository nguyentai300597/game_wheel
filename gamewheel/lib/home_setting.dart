import 'package:flutter/material.dart';

class HomeSetting extends StatefulWidget {
  final List<String>? items;
  const HomeSetting({super.key, this.items});

  @override
  State<HomeSetting> createState() => _HomeSettingState();
}

class _HomeSettingState extends State<HomeSetting> {
  List<String> data = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = widget.items ?? [];
  }

  @override
  void didUpdateWidget(covariant HomeSetting oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    data = widget.items ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Container(
                  //   child: const TextField(
                  //     decoration: InputDecoration(

                  //       hintText: "2342",
                  //       border: InputBorder.none,
                  //       // enabledBorder: OutlineInputBorder(
                  //       //   borderSide: BorderSide(width: 1, color: Colors.grey),
                  //       // ),
                  //     ),
                  //   ),
                  // )
                  for (int i = 0; i < data.length; i++)
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: data[i],
                        ),
                      ),
                    )
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            child: ElevatedButton(onPressed: () {}, child: Text("DONE")),
          )
        ],
      ),
    ));
  }
}
