import 'package:eco_smart/screens/common/text_widget.dart';
import 'package:flutter/material.dart';
class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: TextWidget(text: "Notifications", textColor: Colors.black, fontWeight: FontWeight.w500, fontSize: 16,),
      ),
    );
  }
}
