import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eco_smart/core/app_icons.dart';
import 'package:eco_smart/core/colors.dart';
import 'package:eco_smart/core/extension.dart';
import 'package:eco_smart/core/route/navigator.dart';
import 'package:eco_smart/core/route/routes_const.dart';
import 'package:eco_smart/data/injection.dart';
import 'package:eco_smart/data/local_storage.dart';
import 'package:eco_smart/screens/common/flash.dart';
import 'package:eco_smart/screens/common/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:stories_for_flutter/stories_for_flutter.dart';

class Home extends StatefulWidget {
  const Home({super.key, this.index});
  final int? index;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
  String location = 'Toshkent, Yunusobod, 17-kvartal, 23-dom';
  Map<String, dynamic>? dropdownValue;
  Map<String, dynamic>? dropdownValueService;
  final controllerComment = TextEditingController();
  final controllerPhone = TextEditingController();
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
        toolbarHeight: 0,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: size.width - 32,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                      text: "Salom, ${getIt<LocalStorage>().getPhone()} 👋",
                      textColor: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      overFlow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    IconButton(
                      splashRadius: 24,
                      onPressed: () {
                        navigator.pushNamed(RouteList.notifications);
                      },
                      icon: SvgPicture.asset(
                        AppIcons.notification,
                        color: Color(0xFF00697C),
                        cacheColorFilter: true,
                      ),
                    )
                  ],
                ),
              ),
              20.h,
              Container(
                width: double.infinity,
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: splashGradientColor1,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0, left: 16),
                      child: TextWidget(
                        text: "Keraksiz buyumingiz haqida bizga xabar bering!",
                        textColor: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0, left: 16),
                      child: Container(
                        height: 40,
                        width: size.width / 2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.white,
                        ),
                        child: Material(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(16),
                            onTap: () {
                              navigator.pushNamed(RouteList.service);
                            },
                            child: Center(
                              child: TextWidget(
                                  text: "Start",
                                  textColor: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              20.h,
              Stories(
                displayProgress: true,
                storyItemList: [
                  StoryItem(
                    name: "1nd",
                    thumbnail: NetworkImage(
                      "https://www.shareicon.net/data/512x512/2017/03/29/881758_cup_512x512.png",
                    ),
                    stories: [
                      Scaffold(
                        body: Center(
                          child: Text(
                            "That's it, Folks !",
                            style: TextStyle(
                              color: Color(0xff777777),
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  StoryItem(
                    name: "2nd",
                    thumbnail: NetworkImage(
                      "https://www.shareicon.net/data/512x512/2017/03/29/881758_cup_512x512.png",
                    ),
                    stories: [
                      Scaffold(
                        body: Center(
                          child: Text(
                            "That's it, Folks !",
                            style: TextStyle(
                              color: Color(0xff777777),
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  StoryItem(
                    name: "3nd",
                    thumbnail: NetworkImage(
                      "https://www.shareicon.net/data/512x512/2017/03/29/881758_cup_512x512.png",
                    ),
                    stories: [
                      Scaffold(
                        body: Center(
                          child: Text(
                            "That's it, Folks !",
                            style: TextStyle(
                              color: Color(0xff777777),
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  StoryItem(
                    name: "4nd",
                    thumbnail: NetworkImage(
                      "https://www.shareicon.net/data/512x512/2017/03/29/881758_cup_512x512.png",
                    ),
                    stories: [
                      Scaffold(
                        body: Center(
                          child: Text(
                            "That's it, Folks !",
                            style: TextStyle(
                              color: Color(0xff777777),
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  StoryItem(
                    name: "5nd",
                    thumbnail: NetworkImage(
                      "https://www.shareicon.net/data/512x512/2017/03/29/881758_cup_512x512.png",
                    ),
                    stories: [
                      Scaffold(
                        body: Center(
                          child: Text(
                            "That's it, Folks !",
                            style: TextStyle(
                              color: Color(0xff777777),
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              20.h,
              Container(
                width: double.infinity,
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: splashGradientColor1,
                ),
                child: TextButton(
                    onPressed: () {
                      flash("Tez kunda", Colors.green);
                    },
                    child: TextWidget(
                      text: "Map Service",
                      textColor: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
