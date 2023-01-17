import 'package:database_trial/google_maps/google_maps_page.dart';
import 'package:database_trial/ui/bas_sehife/bas_sehife_birlesme.dart';
import 'package:database_trial/ui/evler/evler.dart';
import 'package:database_trial/ui/profile/daxil_ol/daxil_ol.dart';
import 'package:database_trial/ui/profile/daxil_ol/hesab_screen.dart';
import 'package:database_trial/ui/secilmisler/secilmisler_birlesme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../data/evler_data/evler_data.dart';
import '../axtaris/axtaris_birlesme.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<MainScreenWidget> createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  int initialIndex = 0;
  final screens = [
    const SonSatilnaBirlesmeWidget(),
    const BirlesmisSecilmelerWidget(),
    const GoogleMapsPage(),
    const AxtarisBirlesmeWidget(),
    const HesabScreenWidget(),
  ];

  void SelectedTab(int index) {
    // if (initialIndex == index) return;
    if (initialIndex == index) {
      // Navigate to the tab's root route
      navigatorKeyList[index].currentState?.popUntil((route) {
        return route.isFirst;
      });
    }
    setState(() {
      initialIndex = index;
    });
  }

  var navigatorKeyList = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>()
  ];
  @override
  Widget build(BuildContext context) {
    final model = context.watch<SatilanEvlerData>();

    return WillPopScope(
      onWillPop: () async {
        final isfirstRouteinCurrentTab =
            !await navigatorKeyList[initialIndex].currentState!.maybePop();
        print(
            'isFirstRouteInCurrentTab: ' + isfirstRouteinCurrentTab.toString());
        return isfirstRouteinCurrentTab;
      },
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          selectedFontSize: 12,
          unselectedFontSize: 12,
          currentIndex: initialIndex,
          backgroundColor: Colors.white,
          selectedItemColor: Colors.blue,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 11.0),
                child: SvgPicture.asset('assets/images/House1.svg'),
              ),
              label: 'Baş Səhifə',
            ),
            BottomNavigationBarItem(
              // backgroundColor: Colors.red,
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 11.0),
                child: SvgPicture.asset('assets/images/HeartStraight.svg'),
              ),
              label: 'Seçilmişlər',
            ),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: CircleAvatar(
                      radius: 23,
                      backgroundColor: const Color.fromRGBO(34, 186, 104, 1),
                      child: SvgPicture.asset('assets/images/MapTrifold.svg')),
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 11.0),
                  child: SvgPicture.asset('assets/images/Union.svg'),
                ),
                label: 'Axtarış'),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 11.0),
                  child: SvgPicture.asset('assets/images/Profile.svg'),
                ),
                label: 'Profil'),
          ],
          onTap: SelectedTab,
        ),
        body: IndexedStack(index: initialIndex, children: screens),
      ),
    );
  }
}
