import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gamewheel/generated/l10n.dart';
import 'package:gamewheel/widget/widget_bg.dart';

class HomeSetting extends StatefulWidget {
  final List<String>? items;
  const HomeSetting({super.key, this.items});

  @override
  State<HomeSetting> createState() => _HomeSettingState();
}

class _HomeSettingState extends State<HomeSetting> {
  List<String> data = [];
  List<TextEditingController> dataController = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = widget.items ?? [];
    // data.forEach((element) {
    //   dataController.add(TextEditingController());
    // });
    // data.forEach((element) {
    //   dataController[element]=dât
    // })
  }

  @override
  void didUpdateWidget(covariant HomeSetting oldWidget) {
    super.didUpdateWidget(oldWidget);
    data = widget.items ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: WidgetBg(
      onBack: () => Navigator.pop(context, []),
      child: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    for (int i = 0; i < data.length; i++)
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Slidable(
                          key: ValueKey(data[i]),
                          startActionPane: ActionPane(
                            motion: const ScrollMotion(),
                            dismissible: DismissiblePane(onDismissed: () {
                              doNothing(context, index: i);
                            }),
                            children: [
                              // A SlidableAction can have an icon and/or a label.
                              SlidableAction(
                                onPressed: (context) =>
                                    doNothing(context, index: i),
                                backgroundColor: Color(0xFFFE4A49),
                                foregroundColor: Colors.white,
                                icon: Icons.delete,
                                label: 'Delete',
                              ),
                              // SlidableAction(
                              //   onPressed: (context) => doNothing(context),
                              //   backgroundColor: Color(0xFF21B7CA),
                              //   foregroundColor: Colors.white,
                              //   icon: Icons.share,
                              //   label: 'Share',
                              // ),
                            ],
                          ),
                          child: TextField(
                            // controller: dataController[i],
                            //   keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                //  enabledBorder: ,
                                border: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                  color: Colors.red,
                                )),
                                // labelText: data[i],

                                hintText: data[i]),

                            onChanged: (value) {
                              data[i] = value;
                              // dataController[i].text = value;
                            },
                          ),
                        ),
                      ),
                    InkWell(
                      onTap: () {
                        data.add("");
                        //  dataController.add(TextEditingController());
                        setState(() {});
                      },
                      child: Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                            border: Border.all(
                          width: 1,
                          color: Colors.grey,
                        )),
                        padding: const EdgeInsets.all(15),
                        child: const Icon(Icons.add),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, data);

                    // data.forEach((element) {
                    //   print("-----${element}");
                    // });
                  },
                  child: Text(S.of(context).done)),
            )
          ],
        ),
      ),
    ));
  }

  void doNothing(BuildContext context, {int index = 0}) {
    data.removeAt(index);
    setState(() {});
  }

  // _getList() {
  //   return ListView.builder(itemBuilder: itemBuilder)
  // }
}
