import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreenWidget extends StatefulWidget {
  const SplashScreenWidget({super.key});

  @override
  State<SplashScreenWidget> createState() => _SplashScreenWidgetState();
}

class _SplashScreenWidgetState extends State<SplashScreenWidget> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 12), () {
      if (mounted) {
        Navigator.of(
          context,
        ).pushNamed('hesab_screen');
      }
    });
  }

  @override
  void dispose() {
    // ignore: todo
    // TODO: implement dispose
    super.dispose();
    // animationController.dispose() instead of your controller.dispose
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(top: 64.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/images/successfulVerif.svg'),
            const Text(
              'Qeydiyyat uğurla tamamlandı!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            )
          ],
        ),
      ),
    ));
  }
}
