import 'package:f_chatbot/Candidate/CandidateChat/modelview/candidateChatViewModel.dart';
import 'package:f_chatbot/core/enum/messageEnum.dart';
import 'package:flutter/material.dart';

class CandidateChatView extends CandidateChatViewModel {
  @override
  void initState() {
    super.initState();
    controller = ScrollController();
    cMessage = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hoşgeldin"),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 9,
            child: SingleChildScrollView(
              controller: controller,
              child: ListView.builder(
                itemCount: chatBotLive.length,
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 10, bottom: 10),
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.only(
                        left: 14, right: 14, top: 10, bottom: 10),
                    child: Align(
                      alignment:
                          (chatBotLive[index].messageType == MessageEnum.SENDER
                              ? Alignment.topRight
                              : Alignment.topLeft),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: (chatBotLive[index].messageType ==
                                  MessageEnum.RECEIVER
                              ? Colors.grey.shade200
                              : Colors.blue[200]),
                        ),
                        padding: EdgeInsets.all(16),
                        child: Text(
                          chatBotLive[index].messageContent,
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Container(
                    height: dynamicHeight(0.3),
                    width: dynamicWidth(1),
                    child: messageFormField()),
              ],
            ),
          )
        ],
      ),
    );
  }

  TextFormField messageFormField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      controller: cMessage,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
          suffixIcon: GestureDetector(
            child: Icon(Icons.send),
            onTap: () => sendMessage(cMessage.text),
          ),
          hintText: "Mesaj"),
    );
  }
}
