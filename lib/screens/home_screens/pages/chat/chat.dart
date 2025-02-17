import 'package:eco_smart/screens/common/text_widget.dart';
import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  const Chat({super.key, this.index});
  final int? index;

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: TextWidget(
          text: "Chat",
          textColor: Colors.black,
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
      ),
    );
  }
}
