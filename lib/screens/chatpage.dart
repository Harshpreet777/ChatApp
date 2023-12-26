import 'dart:async';

import 'package:chatapp/utils/boolean.dart';
import 'package:chatapp/utils/color_constant.dart';
import 'package:flutter/material.dart';

class ChatPageClass extends StatefulWidget {
  const ChatPageClass({super.key});
  @override
  State<ChatPageClass> createState() => _ChatPageClassState();
}

class _ChatPageClassState extends State<ChatPageClass> {
  final myController = TextEditingController();
  bool isSender = false;

  late StreamController<String> streamController;
  @override
  void initState() {
    super.initState();
    streamController = StreamController();
  }

  @override
  void dispose() {
    streamController.close();
    myController.dispose();
    super.dispose();
  }

  List<String> message2 = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'ChatAPP',
            style: TextStyle(fontSize: 25, color: ColorConstant.white),
          ),
          backgroundColor: const Color(0xff273443),
        ),
        backgroundColor: const Color.fromARGB(255, 29, 38, 47),
        body: chatbuild());
  }

  Column chatbuild() {
    return Column(
        children: [
          Expanded(
            child: StreamBuilder<String>(
              stream: streamController.stream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data == '') {
                    message2 = [];
                  }
                  return ListView.builder(
                    reverse: true,
                    shrinkWrap: true,
                    itemCount: message2.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Align(
                            alignment: BooleanClass.isSender == false
                                ? Alignment.topRight
                                : Alignment.topLeft,
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(12)),
                              child: Container(
                                  padding: const EdgeInsets.all(15),
                                  color: Colors.blue,
                                  child: Flexible(
                                    fit: FlexFit.tight,
                                    child: Text(
                                      message2[index].toString(),
                                      style: TextStyle(
                                          color: ColorConstant.white,
                                          fontSize: 20),
                                    ),
                                  )),
                            )),
                      );
                    },
                  );
                } else {
                  return Container();
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              textInputAction: TextInputAction.send,
              onEditingComplete: () {
                setState(() {
                  message2.add(myController.text);
                  for (int i = 0; i < message2.length; i++) {
                    streamController.sink.add(message2[i].toString());
                  }
                  myController.clear();
                });
              },
              onTap: () {
                setState(() {
                  message2.add(myController.text);
                  for (int i = 0; i < message2.length; i++) {
                    streamController.sink.add(message2[i].toString());
                  }
                  myController.clear();
                });
              },
              controller: myController,
              decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.send,
                    color: ColorConstant.white,
                  ),
                  border: const OutlineInputBorder()),
              style: TextStyle(color: ColorConstant.white),
            ),
          )
        ],
      );
  }
}
