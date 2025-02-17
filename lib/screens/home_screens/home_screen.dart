import 'package:eco_smart/screens/home_screens/pages/calculation/calculation.dart';
import 'package:eco_smart/screens/home_screens/pages/chat/chat.dart';
import 'package:eco_smart/screens/home_screens/pages/home/home.dart';
import 'package:eco_smart/screens/home_screens/pages/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:eco_smart/screens/common/custom_bloc_provider.dart';
import 'package:eco_smart/screens/home_screens/bloc/home_screen_bloc.dart';

import 'widget/bottom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomBlocProvider<HomeScreenBloc, HomeScreenState>(
      create: (context) => HomeScreenBloc(),
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: BottomNavBar(),
          body: IndexedStack(
            index: state.index,
            children: [
              Home(index: state.index),
              Calculation(index: state.index),
              Chat(index: state.index),
              Profile(index: state.index),
            ],
          ),
        );
      },
    );
  }
}
