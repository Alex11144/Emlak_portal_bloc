import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:database_trial/domain/api_clients/api_client.dart';
import 'package:database_trial/domain/api_clients/api_verif_client.dart';
import 'package:database_trial/domain/api_clients/qovluqlar_api_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:database_trial/data/evler_data/evler_data.dart';
import 'package:database_trial/data/qovluqlar_data/qovluqlar_data.dart';

import '../evler/elanlarList/elanlar_list.dart';

class SatilanSonElanlarList extends StatefulWidget {
  const SatilanSonElanlarList({super.key});
  @override
  State<SatilanSonElanlarList> createState() => _SatilanSonElanlarListState();
}

class _SatilanSonElanlarListState extends State<SatilanSonElanlarList> {
  ScrollController controller = ScrollController();
  // final evler = context.read<Evler>();
  final apiClient = ApiClient();
  final apiVerifClient = ApiVerificationClient();
  final qqovluqlarApiClient = QovluqlarApiClient();

  // bool _isLoading = true;
  // final _client = QovluqlarApiClient();
  // final _clientQovluwlarSecure = QovluqlarSecureStorage();
  // @override
  // void initState() {
  //   super.initState();
  //   BackButtonInterceptor.add(myInterceptor);
  //   final auth = Provider.of<SatilanEvlerData>(context, listen: false);

  //   // final auth = Provider.of<Evler>(context, listen: false);
  //   // auth.getFoldersByAnnounce(id);
  //   // getHouses();
  //   // controller.addListener(() {
  //   //   try {
  //   //     if (controller.position.maxScrollExtent == controller.offset) {
  //   //       WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
  //   //         auth.reloadPosts();
  //   //       });

  //   //       // setState(() {});
  //   //     }
  //   //   } catch (e) {}
  //   // });
  //   // auth.snackBarContext = context;
  // }
// @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//         final auth = Provider.of<SatilanEvlerData>(context, listen: false);

//   }
  final secureStorage = const FlutterSecureStorage();
  // List favs = [];
  // var _posts = <dynamic>[];
  // List<dynamic> get posts => _posts;

  // Future<void> getHouses() async {
  //   final posts = await apiVerifClient.getHouses();
  //   _posts += posts;
  //   setState(() {});
  // }

  Future refresh() async {
    await Future.delayed(const Duration(milliseconds: 500));
    controller.addListener(() {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        // final auth = Provider.of<Evler>(context, listen: false);
        // _posts.clear();
        // apiClient.page = 1;
        // try {
        //   controller = ScrollController(
        //       initialScrollOffset: controller.position.minScrollExtent);
        // } catch (e) {}

        // controller.initialScrollOffset = controller.position.minScrollExtent;
        // auth.reloadPosts();
        // controller.jumpTo(0);
        // controller.animateTo(0,
        //     duration: Duration(milliseconds: 500), curve: Curves.fastOutSlowIn);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - 48) / 3;
    final double itemWidth = size.width / 2;
    final evler = context.watch<SatilanEvlerData>().lastForSale;
    final watch = context.watch<SatilanEvlerData>();
    // final favourites = context.watch<Evler>().favorite;
    final watchFavs = context.watch<SatilanEvlerData>().favorite;
    final qovluqlar = context.read<QovluqlarData>();
    final watchKiraye = context.watch<SatilanEvlerData>().lastForRent;

    // final watchSecure = context.watch<QovluqlarSecureStorage>();
    return RefreshIndicator(
        displacement: 20,
        // edgeOffset: 100,
        onRefresh: refresh,
        child: CustomScrollView(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            controller: controller,
            scrollDirection: Axis.vertical,
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(top: 12.0, bottom: 8),
                  child: const Text(
                    'Satılan Son Elanlar',
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              SliverGrid.count(
                  childAspectRatio: (itemWidth / itemHeight),
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  // controller: ScrollController(keepScrollOffset: false),
                  crossAxisCount: 2,
                  children: List.generate(
                    evler.length,
                    (index) {
                      // if (index < evler.length) {
                      final ev = evler[index];
                      // if (ev.cover == null) return ev.cover;
                      var dateTime = DateTime.parse(ev.announceDate);
                      var formate1 =
                          "${dateTime.day}-${dateTime.month}-${dateTime.year}";
                      return Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: 0.2, color: Colors.grey),
                            borderRadius: BorderRadius.circular(8)),
                        child: InkWell(
                          customBorder: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          onTap: () {
                            watch.satilanEvlerOnTap(index, context);
                            setState(() {});
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Stack(
                                alignment: Alignment.topRight,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                      // ignore: prefer_interpolation_to_compose_strings
                                      'https://d2jcoi69vojtfw.cloudfront.net/' +
                                          ev.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return const Text(
                                            'unable to load image');
                                        // width: 300,
                                        // height: 200,
                                        // fit: BoxFit.contain);
                                      },
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              7,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Material(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      color: Colors.transparent,
                                      child: IconButton(
                                          onPressed: () async {
                                            watch.snackBarContext = context;
                                            // watch.favouritesPostToDb(
                                            //     watch.posts[index].id);
                                            //elanontap(ev.id)
                                            // print(index);
                                            id = evler[index].id;
                                            listIndex = (await watch
                                                    .getFoldersByAnnounce(id))
                                                .map((e) => e.listId)
                                                .toList();
                                            // listIndex =
                                            //     qovluqlar.lists[index].listId;
                                            // await watch.isTokenLoaded()
                                            //     ?
                                            qovluqlar.modalBottomSheet(
                                                context: context,
                                                index: index,
                                                posts: ev);
                                            // : qovluqlar
                                            //     .alertDialogIfNotLogged(
                                            //         context);
                                            index1 = index;

                                            setState(() {});
                                          },
                                          icon: watchFavs
                                                  .map((e) => e.id)
                                                  .contains(watch
                                                      .lastForSale[index].id)
                                              ? SvgPicture.asset(
                                                  'assets/images/HeartStraightRed.svg')
                                              : SvgPicture.asset(
                                                  'assets/images/heartIcon.svg')))
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "${ev.price} AZN",
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      ev.address.toString(),
                                      style: const TextStyle(fontSize: 11),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: false,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    // ignore: prefer_interpolation_to_compose_strings
                                    Text(
                                      '${'${ev.roomCount} otaqli - ' + ev.space} m2',
                                      style: const TextStyle(fontSize: 11),
                                    ),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    Text(
                                      'Baki, $formate1',
                                      style: const TextStyle(
                                          color:
                                              Color.fromRGBO(51, 51, 51, 0.6),
                                          fontSize: 11),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                      // }
                    },
                  )),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 8),
                  child: const Text(
                    'Kirayə Verilən Elanlar',
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              SliverGrid.count(
                  childAspectRatio: (itemWidth / itemHeight),
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  // controller: ScrollController(keepScrollOffset: false),
                  crossAxisCount: 2,
                  children: List.generate(
                    watchKiraye.length,
                    (index) {
                      // if (index < evler.length) {
                      final ev = watchKiraye[index];
                      // if (ev.cover == null) return ev.cover;
                      var dateTime = DateTime.parse(ev.announceDate);
                      var formate1 =
                          "${dateTime.day}-${dateTime.month}-${dateTime.year}";
                      return Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: 0.2, color: Colors.grey),
                            borderRadius: BorderRadius.circular(8)),
                        child: InkWell(
                          customBorder: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          onTap: () {
                            watch.kirayeEvlerOnTap(index, context);
                            setState(() {});
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Stack(
                                alignment: Alignment.topRight,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                      // ignore: prefer_interpolation_to_compose_strings
                                      'https://d2jcoi69vojtfw.cloudfront.net/' +
                                          ev.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return const Text(
                                            'unable to load image');
                                        // width: 300,
                                        // height: 200,
                                        // fit: BoxFit.contain);
                                      },
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              7,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Material(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      color: Colors.transparent,
                                      child: IconButton(
                                          onPressed: () async {
                                            watch.snackBarContext = context;
                                            // watch.favouritesPostToDb(
                                            //     watch.posts[index].id);
                                            //elanontap(ev.id)
                                            // print(index);
                                            id = ev.id;
                                            listIndex = (await watch
                                                    .getFoldersByAnnounce(id))
                                                .map((e) => e.listId)
                                                .toList();
                                            // listIndex =
                                            //     qovluqlar.lists[index].listId;
                                            qovluqlar.modalBottomSheet(
                                                context: context,
                                                index: index,
                                                posts: ev);
                                            setState(() {});
                                          },
                                          icon: watchFavs
                                                  .map((e) => e.id)
                                                  .contains(
                                                      watchKiraye[index].id)
                                              ? SvgPicture.asset(
                                                  'assets/images/HeartStraightRed.svg')
                                              : SvgPicture.asset(
                                                  'assets/images/heartIcon.svg')))
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "${ev.price} AZN",
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      ev.address.toString(),
                                      style: const TextStyle(fontSize: 11),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: false,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    // ignore: prefer_interpolation_to_compose_strings
                                    Text(
                                      '${'${ev.roomCount} otaqli - ' + ev.space} m2',
                                      style: const TextStyle(fontSize: 11),
                                    ),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    Text(
                                      'Baki, $formate1',
                                      style: const TextStyle(
                                          color:
                                              Color.fromRGBO(51, 51, 51, 0.6),
                                          fontSize: 11),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                      // }
                    },
                  )),
              // const SliverToBoxAdapter(
              //   child: Center(
              //       child: Padding(
              //     padding: EdgeInsets.all(30.0),
              //     child: CircularProgressIndicator(
              //       strokeWidth: 4,
              //     ),
              //   )),
              // )
            ]));
  }
}
