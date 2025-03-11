import 'package:easy_localization/easy_localization.dart';
import 'package:eco_smart/core/app_icons.dart';
import 'package:eco_smart/core/localization/locale_keys.dart';
import 'package:eco_smart/core/route/navigator.dart';
import 'package:eco_smart/core/route/routes_const.dart';
import 'package:eco_smart/screens/common/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: TextWidget(
          text: LocaleKeys.profile.tr(),
          textColor: Colors.black,
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
      ),
      body: Column(
        children: [
          CupertinoListTile(
            trailing: context.locale.languageCode == "uz"
                ? Image.asset(AppImages.flagUz, width: 24, height: 24)
                : context.locale.languageCode == "ru"
                    ? Image.asset(AppImages.flagRu, width: 24, height: 24)
                    : context.locale.languageCode == "en"
                        ? Image.asset(AppImages.flagEn, width: 24, height: 24)
                        : context.locale.languageCode == "tr"
                            ? Image.asset(AppImages.flagTr,
                                width: 24, height: 24)
                            : Image.asset(AppImages.flagUz,
                                width: 24, height: 24),
            title: TextWidget(
              text: LocaleKeys.language.tr(),
              textColor: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
            onTap: () {
              navigator.pushNamed(RouteList.languageP);
            },
          ),
        ],
      ),
    );
  }
}
