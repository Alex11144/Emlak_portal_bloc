// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DetailsImagesSlider extends StatelessWidget {
  dynamic images;
  DetailsImagesSlider({
    Key? key,
    required this.images,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List args = ModalRoute.of(context)!.settings.arguments as List;

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            foregroundColor: Colors.black,
          ),
          body: Center(
            child: CarouselSlider(
              items: args
                  .map(
                    (e) => Container(
                      margin: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://d2jcoi69vojtfw.cloudfront.net/' + e),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  )
                  .toList(),
              options: CarouselOptions(
                scrollDirection: Axis.vertical,
                // initialPage: args.map((e) => e),
                height: MediaQuery.of(context).size.height,
                enlargeCenterPage: true,
                autoPlay: false,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
            ),
          )),
    );
  }
}
