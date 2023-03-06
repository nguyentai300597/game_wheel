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
                    ),
                  InkWell(
                    onTap: () {
                      data.add("");
                      setState(() {});
                    },
                    child: Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                          border: Border.all(
                        width: 1,
                        color: Colors.grey,
                      )),
                      padding: EdgeInsets.all(15),
                      child: Icon(Icons.add),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("DONE")),
          )
        ],
      ),
    ));
  }
}
