import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eco_smart/core/colors.dart';
import 'package:eco_smart/core/extension.dart';
import 'package:eco_smart/core/route/navigator.dart';
import 'package:eco_smart/screens/common/flash.dart';
import 'package:eco_smart/screens/common/loader.dart';
import 'package:eco_smart/screens/common/my_elevated_button.dart';
import 'package:eco_smart/screens/common/text_form_field.dart';
import 'package:eco_smart/screens/common/text_widget.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:path_provider/path_provider.dart';

class ServicePage extends StatefulWidget {
  const ServicePage({super.key, this.index});
  final int? index;

  @override
  State<ServicePage> createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
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
  List<Map<String, dynamic>> listService = <Map<String, dynamic>>[
    {
      'type': 'Ha',
      'id': 1,
    },
    {
      'type': 'Yoq (O\'zim olib boraman)',
      'id': 2,
    },
  ];
  bool isLoading = false;

  Map<String, dynamic>? dropdownValue;
  Map<String, dynamic>? dropdownValueService;
  final controller = TextEditingController();
  final controllerComment = TextEditingController();
  final controllerPhone = TextEditingController();
  final controllerLocation = TextEditingController();
  final List<File> _images = [];
  final ImagePicker _picker = ImagePicker();
  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _images.add(File(image.path));
      });
    }
  }

  Future<void> _removeImage(int index) async {
    setState(() {
      _images.removeAt(index);
    });
  }

  // Create a CollectionReference called users that references the firestore collection
  CollectionReference orders = FirebaseFirestore.instance.collection('orders');

  @override
  void initState() {
    dropdownValue = list.first;
    dropdownValueService = listService.first;

    super.initState();
  }

  var maskFormatter = new MaskTextInputFormatter(
      mask: '###',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);
  var maskFormatterPhone = new MaskTextInputFormatter(
      mask: '+998 (##) ###-##-##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                text: "* Mahsulot turini tanlang",
                textColor: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
              10.h,
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(6)),
                child: DropdownMenu<Map<String, dynamic>>(
                  width: double.infinity,
                  initialSelection: list.first,
                  onSelected: (Map<String, dynamic>? value) {
                    // This is called when the user selects an item.
                    setState(() {
                      dropdownValue = value!;
                    });
                  },
                  dropdownMenuEntries: list
                      .map<DropdownMenuEntry<Map<String, dynamic>>>(
                          (Map<String, dynamic> value) {
                    return DropdownMenuEntry<Map<String, dynamic>>(
                        value: value, label: value['type']);
                  }).toList(),
                ),
              ),
              20.h,
              TextWidget(
                text: "* Olib ketishimizni hohlaysizmi?",
                textColor: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
              10.h,
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(6)),
                child: DropdownMenu<Map<String, dynamic>>(
                  width: double.infinity,
                  initialSelection: listService.first,
                  onSelected: (Map<String, dynamic>? value) {
                    // This is called when the user selects an item.
                    setState(() {
                      dropdownValueService = value!;
                    });
                  },
                  dropdownMenuEntries: listService
                      .map<DropdownMenuEntry<Map<String, dynamic>>>(
                          (Map<String, dynamic> value) {
                    return DropdownMenuEntry<Map<String, dynamic>>(
                        value: value, label: value['type']);
                  }).toList(),
                ),
              ),
              20.h,
              TextWidget(
                text: "* Nechi kilogram chiqadi?",
                textColor: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
              10.h,
              MyTextFormField(
                controller: controller,
                inputFormatter: [maskFormatter],
                radius: 6,
                hintText: "Masalan: 20 kg",
                textInputType: TextInputType.number,
                textInputAction: TextInputAction.next,
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextWidget(
                      text: "Kg",
                      textColor: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      textAlign: TextAlign.center,
                    ),
                    16.w,
                  ],
                ),
              ),
              20.h,
              TextWidget(
                text: "Rasmi yuboring",
                textColor: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
              10.h,
              Container(
                width: MediaQuery.of(context).size.width,
                height: 44,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(6),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      splashGradientColor1,
                      splashGradientColor2,
                    ],
                  ),
                ),
                child: Material(
                  color: Colors.transparent,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(6),
                  ),
                  child: InkWell(
                    onTap: _pickImage,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(6),
                    ),
                    child: Center(
                      child: TextWidget(
                        text: "Rasm tanlash",
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        textColor: kPrimaryWhiteColor,
                      ),
                    ),
                  ),
                ),
              ),
              10.h,
              _images.isNotEmpty
                  ? SizedBox(
                      height: 120,
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 8,
                                mainAxisSpacing: 8),
                        itemCount: _images.length,
                        itemBuilder: (context, index) {
                          return Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(6),
                                child: Image.file(
                                  _images[index],
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: double.infinity,
                                ),
                              ),
                              Positioned(
                                right: 5,
                                top: 5,
                                child: GestureDetector(
                                  onTap: () => _removeImage(index),
                                  child: const Icon(
                                    Icons.remove_circle,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    )
                  : SizedBox(),
              20.h,
              TextWidget(
                text: "* Telefon nomerizni kiriting",
                textColor: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
              10.h,
              MyTextFormField(
                controller: controllerPhone,
                inputFormatter: [maskFormatterPhone],
                radius: 6,
                hintText: "+998 (##) ###-##-##",
                textInputType: TextInputType.number,
                textInputAction: TextInputAction.next,
              ),
              20.h,
              TextWidget(
                text: "* Joylashuvni kiriting",
                textColor: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
              10.h,
              MyTextFormField(
                controller: controllerLocation,
                radius: 6,
                hintText: "Masalan: Toshkent shahar, Yunusobod 17",
                textInputType: TextInputType.number,
                textInputAction: TextInputAction.next,
              ),
              20.h,
              TextWidget(
                text: "Izoh qoldiring",
                textColor: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
              10.h,
              MyTextFormField(
                maxLines: 5,
                controller: controllerComment,
                radius: 6,
                hintText: "Izoh... ",
                textInputType: TextInputType.text,
                textInputAction: TextInputAction.next,
              ),
              20.h,
              MyElevatedButton(
                  height: 56,
                  onTap: () async {
                    if (controllerLocation.text.isNotEmpty ||
                        controllerPhone.text.isNotEmpty) {
                      setState(() {
                        isLoading = true;
                      });

                      // Create a storage reference from our app
                      final storageRef = FirebaseStorage.instance.ref();

                      _images.forEach(
                        (element) async {
                          // Create a reference to "mountains.jpg"
                          final mountainsRef =
                              storageRef.child("${element.path}.jpg");

// Create a reference to 'images/mountains.jpg'
                          final mountainImagesRef =
                              storageRef.child("images/${element.path}.jpg");

// While the file names are the same, the references point to different files
                          assert(mountainsRef.name == mountainImagesRef.name);
                          assert(mountainsRef.fullPath !=
                              mountainImagesRef.fullPath);

                          Directory appDocDir =
                              await getApplicationDocumentsDirectory();
                          String filePath =
                              '${appDocDir.absolute}/${element.path}.jpg';
                          File file = File(filePath);

                          try {
                            await mountainsRef.putFile(file);
                          } on FirebaseException catch (e) {
                            print(e);
                          }
                        },
                      );

                      Map<String, dynamic> data = {
                        "type": dropdownValue,
                        "service": dropdownValueService,
                        "weight": controller.text,
                        "location": controllerLocation.text,
                        "phone": controllerPhone.text,
                        "comment": controllerComment.text,
                        "images": [
                          for (File image in _images) image.path.toString()
                        ]
                      };

                      // Call the user's CollectionReference to add a new user
                      await orders.add(data).then((value) {
                        flash("Qabul qilindi", Colors.green);

                        navigator.pop();

                        showDialog(
                          context: context,
                          builder: (context) {
                            return CupertinoAlertDialog(
                              title: TextWidget(
                                text: "Operatorlar sizga aloqaga chiqadi",
                                textColor: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                              content: TextWidget(
                                text: "Ushbu harakatingizni qadirlaymiz!",
                                textColor: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                              actions: [
                                CupertinoDialogAction(
                                  child: TextWidget(
                                    text: "Ok",
                                    textColor: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                  onPressed: () {
                                    navigator.pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }).catchError(
                          (error) => print("Failed to add user: $error"));

                      setState(() {
                        isLoading = false;
                      });
                    } else {
                      flash("Ma'lumotlarni to'ldiring", Colors.red);
                    }
                  },
                  expanded: true,
                  radius: 6,
                  primaryColor: Colors.black,
                  child: isLoading
                      ? Center(
                          child: Loader(
                            color: Colors.white,
                          ),
                        )
                      : TextWidget(
                          text: "Jo'natish",
                          textColor: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        )),
              50.h,
            ],
          ),
        ),
      ),
    );
  }
}
