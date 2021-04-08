import 'package:flutter/material.dart';
import 'package:im_flutter/chat/message_item.dart';
import './message_data.dart';
import 'package:date_format/date_format.dart';
// import '../common/touch_callback.dart';

//聊天列表页
class MessagePage extends StatefulWidget {
  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: messageData.length,//个数
          itemBuilder: (BuildContext context, int index) {//每个列表
            return MessageItem(messageData[index]);
          }),
    );
  }
}
