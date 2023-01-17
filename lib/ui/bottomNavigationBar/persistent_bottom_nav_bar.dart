import 'package:database_trial/ui/axtaris/axtaris_birlesme.dart';
import 'package:database_trial/ui/bas_sehife/bas_sehife_birlesme.dart';
import 'package:database_trial/ui/profile/daxil_ol/hesab_screen.dart';
import 'package:database_trial/ui/secilmisler/secilmisler_birlesme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../google_maps/google_maps_page.dart';

List<Widget> _buildScreens() {
  return [
    const SonSatilnaBirlesmeWidget(),
    const BirlesmisSecilmelerWidget(),
    const GoogleMapsPage(),
    const AxtarisBirlesmeWidget(),
    const HesabScreenWidget(),
  ];
}

List<PersistentBottomNavBarItem> _navBarsItems() {
  return [
    PersistentBottomNavBarItem(
      icon: Padding(
        padding: const EdgeInsets.only(bottom: 11.0),
        child: SvgPicture.asset('assets/images/House1.svg'),
      ),
      title: 'Baş Səhifə',
    ),
    PersistentBottomNavBarItem(
      // backgroundColor: Colors.red,
      icon: Padding(
        padding: const EdgeInsets.only(bottom: 11.0),
        child: SvgPicture.asset('assets/images/HeartStraight.svg'),
      ),
      title: 'Seçilmişlər',
    ),
    PersistentBottomNavBarItem(
        icon: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: CircleAvatar(
              radius: 23,
              backgroundColor: const Color.fromRGBO(34, 186, 104, 1),
              child: SvgPicture.asset('assets/images/MapTrifold.svg')),
        ),
        title: ''),
    PersistentBottomNavBarItem(
        icon: Padding(
          padding: const EdgeInsets.only(bottom: 11.0),
          child: SvgPicture.asset('assets/images/Union.svg'),
        ),
        title: 'Axtarış'),
    PersistentBottomNavBarItem(
        icon: Padding(
          padding: const EdgeInsets.only(bottom: 11.0),
          child: SvgPicture.asset('assets/images/Profile.svg'),
        ),
        title: 'Profil'),
  ];
}

class PersistentNavBar extends StatefulWidget {
  const PersistentNavBar({super.key});

  @override
  State<PersistentNavBar> createState() => _PersistentNavBarState();
}

class _PersistentNavBarState extends State<PersistentNavBar> {
  late PersistentTabController _controller;
  late bool _hideNavBar;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController();
    _hideNavBar = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: _controller,
        hideNavigationBar: _hideNavBar,
        screens: _buildScreens(),
        items: _navBarsItems(),
      ),
    );
  }
}
