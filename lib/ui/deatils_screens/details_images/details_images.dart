import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:database_trial/ui/navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class DetailedImages extends StatelessWidget {
  final images;
  const DetailedImages({super.key, this.images});

  @override
  Widget build(BuildContext context) {
    final List args = ModalRoute.of(context)!.settings.arguments as List;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 5, 16, 16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      iconSize: 40,
                      onPressed: () => MainNavigation.navigationPop(context),
                      icon: Image.asset(
                        'assets/images/arrow_back.png',
                      )),
                  // Text(
                  //   _details.propertyType +
                  //       ',' +
                  //       ' ' +
                  //       _details.price.toString() +
                  //       ' AZN',
                  //   style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                  // ),
                  IconButton(
                      iconSize: 40,
                      onPressed: () {},
                      icon: Image.asset('assets/images/share_details.png'))
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: GridView.custom(
                    physics: const BouncingScrollPhysics(),
                    gridDelegate: SliverStairedGridDelegate(tileBottomSpace: 10,
                        // mainAxisSpacing: 5,
                        // crossAxisSpacing: 1,
                        pattern: [
                          const StairedGridTile(1, 2),
                          const StairedGridTile(0.5, 1),
                          const StairedGridTile(0.5, 1),
                          const StairedGridTile(0.5, 1),
                          const StairedGridTile(0.5, 1)
                        ]),
                    childrenDelegate: SliverChildBuilderDelegate(
                        childCount: args.length, (context, index) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(
                          8,
                          8,
                          8,
                          8,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: InkWell(
                            onTap: () {
                              MainNavigation.navigateToDetailedImagesSlider(
                                  context, images, index);
                            },
                            child: CachedNetworkImage(
                              imageUrl:
                                  'https://d2jcoi69vojtfw.cloudfront.net/' +
                                      args[index],
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
