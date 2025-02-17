import 'package:eco_smart/screens/common/text_widget.dart';
import 'package:flutter/material.dart';
class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextWidget(text: "page1", textColor: Colors.black, fontWeight: FontWeight.w500, fontSize: 22),
      ),
    );
  }
}
