import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:eco_smart/core/app_icons.dart';
import 'package:eco_smart/core/colors.dart';
import 'package:eco_smart/core/extension.dart';
import 'package:eco_smart/core/route/navigator.dart';
import 'package:eco_smart/screens/common/text_widget.dart';
import 'package:eco_smart/screens/home_screens/bloc/home_screen_bloc.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.paddingOf(navigator.context);
    return BlocBuilder<HomeScreenBloc, HomeScreenState>(
        builder: (context, state) {
      return Container(
        padding: EdgeInsets.only(
          left: 10,
          right: 10,
          top: 5,
          bottom: padding.bottom < 10 ? 10 : padding.bottom,
        ),
        decoration: BoxDecoration(
          color: kPrimaryWhiteColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, -6),
              color: kPrimaryBlackColor.withOpacity(.1),
              blurRadius: 24,
            ),
          ],
        ),
        child: Row(
          children: [
            _item("Bosh sahifa", 0, state.index == 0),
            _item("Kalkulyator", 1, state.index == 1),
            _item("Chat", 2, state.index == 2),
            _item("Profile", 3, state.index == 3),
          ],
        ),
      );
    });
  }

  _item(String label, int index, bool selected) {
    return Expanded(
      child: InkWell(
        onTap: () {
          if (!selected) {
            context.read<HomeScreenBloc>().add(PageChanged(index: index));
          }
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            6.h,
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: SvgPicture.asset(
                selected ? itemsColor[index] : items[index],
                height: 24,
                width: 24,
                color: selected ? const Color(0xFF00697C) : null,
                cacheColorFilter: true,
              ),
            ),
            const SizedBox(height: 2),
            TextWidget(
              text: label,
              textColor: selected ? const Color(0xFF00697C) : Colors.grey,
              fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
              fontSize: 10,
            ),
          ],
        ),
      ),
    );
  }
}

List<String> items = [
  AppIcons.home,
  AppIcons.calculation,
  AppIcons.shop,
  AppIcons.profile,
];

List<String> itemsColor = [
  AppIcons.homeColorFull,
  AppIcons.calculationColorFull,
  AppIcons.shopColorFull,
  AppIcons.profileColorFull,
];
