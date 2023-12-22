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
    streamController = StreamController(
      onListen: () {},
    );
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              
              StreamBuilder<String>(
                stream: streamController.stream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
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
                                child: Flexible(
                                  fit: FlexFit.tight,
                                  child: Container(
                                      padding: const EdgeInsets.all(15),
                                      color: Colors.blue,
                                      child: Text(
                                        message2[index].toString(),
                                        style: TextStyle(
                                            color: ColorConstant.white,
                                            fontSize: 20),
                                      )),
                                ),
                              )),
                        );
                      },
                    );
                  } else {
                    return Container();
                  }
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  
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
          ),
        ));
  }
}
