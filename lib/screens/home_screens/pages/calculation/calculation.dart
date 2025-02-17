import 'package:eco_smart/core/colors.dart';
import 'package:eco_smart/core/extension.dart';
import 'package:eco_smart/screens/common/text_form_field.dart';
import 'package:eco_smart/screens/common/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class Calculation extends StatefulWidget {
  const Calculation({super.key, this.index});
  final int? index;

  @override
  State<Calculation> createState() => _CalculationState();
}

class _CalculationState extends State<Calculation> {
  Map<String, dynamic>? dropdownValue;
  List<Map<String, dynamic>> list = <Map<String, dynamic>>[
    {
      'type': 'Temir',
      'id': 1,
    },
    {
      'type': 'Mis',
      'id': 2,
    },
    {
      'type': 'Alimen',
      'id': 3,
    },
    {
      'type': 'Plastik',
      'id': 4,
    },
  ];
  final controller = TextEditingController();
  var maskFormatter = new MaskTextInputFormatter(
      mask: '###',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);
  @override
  void initState() {
    dropdownValue = list.first;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: TextWidget(
          text: "Calculation",
          textColor: Colors.black,
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
      ),
      // body: Padding(
      //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       TextWidget(
      //         text: "* Mahsulot turini tanlang",
      //         textColor: Colors.black,
      //         fontWeight: FontWeight.w500,
      //         fontSize: 16,
      //       ),
      //       10.h,
      //       Container(
      //         decoration: BoxDecoration(
      //             border: Border.all(color: Colors.black),
      //             borderRadius: BorderRadius.circular(6)),
      //         child: DropdownMenu<Map<String, dynamic>>(
      //           width: double.infinity,
      //           initialSelection: list.first,
      //           onSelected: (Map<String, dynamic>? value) {
      //             // This is called when the user selects an item.
      //             setState(() {
      //               dropdownValue = value!;
      //             });
      //           },
      //           dropdownMenuEntries: list
      //               .map<DropdownMenuEntry<Map<String, dynamic>>>(
      //                   (Map<String, dynamic> value) {
      //             return DropdownMenuEntry<Map<String, dynamic>>(
      //                 value: value, label: value['type']);
      //           }).toList(),
      //         ),
      //       ),
      //       20.h,
      //       Center(
      //         child: TextWidget(
      //           text: "X",
      //           textColor: Colors.black,
      //           fontWeight: FontWeight.w700,
      //           fontSize: 18,
      //         ),
      //       ),
      //       20.h,
      //       TextWidget(
      //         text: "* Nechi kilogram chiqadi?",
      //         textColor: Colors.black,
      //         fontWeight: FontWeight.w500,
      //         fontSize: 16,
      //       ),
      //       10.h,
      //       MyTextFormField(
      //         controller: controller,
      //         inputFormatter: [maskFormatter],
      //         radius: 6,
      //         hintText: "Masalan: 20 kg",
      //         textInputType: TextInputType.number,
      //         textInputAction: TextInputAction.next,
      //         suffixIcon: Row(
      //           mainAxisSize: MainAxisSize.min,
      //           mainAxisAlignment: MainAxisAlignment.end,
      //           children: [
      //             TextWidget(
      //               text: "Kg",
      //               textColor: Colors.black,
      //               fontWeight: FontWeight.w400,
      //               fontSize: 16,
      //               textAlign: TextAlign.center,
      //             ),
      //             16.w,
      //           ],
      //         ),
      //       ),
      //       20.h,
      //       Center(
      //         child: TextWidget(
      //           text: "=",
      //           textColor: Colors.black,
      //           fontWeight: FontWeight.w700,
      //           fontSize: 18,
      //         ),
      //       ),
      //       20.h,
      //       Center(
      //         child: ShaderMask(
      //           shaderCallback: (Rect bounds) {
      //             return LinearGradient(
      //               colors: [splashGradientColor1, splashGradientColor2],
      //             ).createShader(bounds);
      //           },
      //           child: const Text(
      //             '200 000 so\'m',
      //             style: TextStyle(
      //               fontSize: 22,
      //               fontWeight: FontWeight.bold,
      //               color: Colors.white, // Default text color
      //             ),
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
