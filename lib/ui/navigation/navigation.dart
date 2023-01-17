import 'package:flutter/material.dart';

class MainNavigation {
  static void navigationPop(BuildContext context) =>
      Navigator.of(context).pop();

  static void navigateToDetailedImages(BuildContext context, imagesList) {
    var args = imagesList;
    Navigator.of(context)
        .pushNamed('/main_screen/details/details_images', arguments: args);
    // print(args);
  }

  static void navigateToDetailedImagesSlider(
      BuildContext context, imagesList, index) {
    var args = imagesList;
    Navigator.of(context).pushNamed(
        '/main_screen/details/details_images/slider',
        arguments: args);
    // print(args);
  }
}
