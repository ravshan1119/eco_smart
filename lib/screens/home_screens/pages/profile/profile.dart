import 'package:eco_smart/core/route/navigator.dart';
import 'package:eco_smart/core/route/routes_const.dart';
import 'package:eco_smart/data/injection.dart';
import 'package:eco_smart/data/local_storage.dart';
import 'package:eco_smart/screens/common/my_elevated_button.dart';
import 'package:eco_smart/screens/common/text_widget.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key, this.index});
  final int? index;

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: TextWidget(
            text: "Profile",
            textColor: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
        body: Column(
          children: [
            ListTile(
              onTap: () {},
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                    text: "Name",
                    textColor: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                  TextWidget(
                    text: "Foydalanuvchi",
                    textColor: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ],
              ),
            ),
            ListTile(
              onTap: () {},
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                    text: "Phone",
                    textColor: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                  TextWidget(
                    text: "+998 99 999 99 99",
                    textColor: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ],
              ),
            ),
            ListTile(
              onTap: () {},
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                    text: "Language",
                    textColor: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                  TextWidget(
                    text: "English",
                    textColor: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ],
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: MyElevatedButton(
                  radius: 16,
                  primaryColor: Colors.black,
                  expanded: true,
                  child: TextWidget(
                      text: "Log out",
                      textColor: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                  onTap: () {
                    getIt<LocalStorage>().setToken("");
                    navigator.pushNamedAndRemoveUntil(
                      RouteList.login,
                      (route) => false,
                    );
                  }),
            )
          ],
        ));
  }
}
