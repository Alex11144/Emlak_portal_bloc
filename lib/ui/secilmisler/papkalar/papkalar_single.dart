// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:database_trial/domain/api_clients/qovluqlar_api_client.dart';
import 'package:database_trial/ui/evler/elanlarList/elanlar_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'package:database_trial/data/evler_data/evler_data.dart';
import 'package:database_trial/data/qovluqlar_data/qovluqlar_data.dart';
import 'package:database_trial/domain/api_clients/api_client.dart';
import 'package:database_trial/domain/api_clients/api_verif_client.dart';

import 'qovluq_yarat_dialog.dart';

class SinglePapkalar extends StatefulWidget {
  final String text;
  const SinglePapkalar({
    Key? key,
    required this.text,
  }) : super(key: key);
  @override
  State<SinglePapkalar> createState() => _SinglePapkalarState();
}

class _SinglePapkalarState extends State<SinglePapkalar> {
  ScrollController controller = ScrollController();
  // final evler = context.read<Evler>();
  final apiClient = ApiClient();
  final apiVerifClient = ApiVerificationClient();
  // bool _isLoading = true;
  // final _client = QovluqlarApiClient();
  // final _clientQovluwlarSecure = QovluqlarSecureStorage();

  @override
  void initState() {
    super.initState();
    // getHouses();
    final auth = Provider.of<SatilanEvlerData>(context, listen: false);

    controller.addListener(() {
      try {
        if (controller.position.maxScrollExtent == controller.offset) {
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            auth.reloadPosts();
          });

          setState(() {});
        }
      } catch (e) {}
    });
  }

  final qovluqlarApi = QovluqlarApiClient();
  final secureStorage = const FlutterSecureStorage();
  // List favs = [];
  // var _posts = <dynamic>[];
  // List<dynamic> get posts => _posts;

  // Future<void> getHouses() async {
  //   final posts = await apiVerifClient.getHouses();
  //   _posts += posts;
  //   setState(() {});
  // }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  Future refresh() async {
    await Future.delayed(const Duration(milliseconds: 500));
    controller.addListener(() {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        qovluqlarApi.addOrRemoveFromList(
          id,
          listIndex,
        );
        setState(() {});
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
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - 48) / 3;
    final double itemWidth = size.width / 2;
    final evler = context.watch<QovluqlarData>().posts;
    final watch = context.watch<QovluqlarData>();
    final modelWatch = context.watch<QovluqlarData>();
    final String args = ModalRoute.of(context)!.settings.arguments as String;
    final watchFavs = context.watch<SatilanEvlerData>().favorite;
    final model = context.watch<SatilanEvlerData>();

    // final favourites = context.watch<Evler>().favorite;
    // final watchFavs = context.watch<QovluqlarData>().favorite;
    // final qovluqlar = context.watch<QovluqlarData>();
    // final watchSecure = context.watch<QovluqlarSecureStorage>();
    return SafeArea(
        child: Scaffold(
            body: Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 21,
                  backgroundColor: const Color.fromRGBO(235, 155, 0, 0.1),
                  child: IconButton(
                      padding: const EdgeInsets.all(0),
                      onPressed: () => Navigator.pop(context),
                      icon: Image.asset(
                        'assets/images/arrow_back.png',
                      )),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 22.0),
                  child: Text(
                    "Seçilmişlər",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
                CircleAvatar(
                  radius: 21,
                  backgroundColor: const Color.fromRGBO(0, 80, 235, 0.1),
                  child: IconButton(
                      // iconSize: 50,
                      onPressed: () {
                        QovluqYaratDialog();
                      },
                      icon: SvgPicture.asset(
                        'assets/images/Folders.svg',
                        height: 50,
                        width: 50,
                      )),
                )
              ],
            ),
          ),
          Expanded(
            flex: 10,
            child: RefreshIndicator(
                displacement: 20,
                // edgeOffset: 100,
                onRefresh: refresh,
                child: evler.isNotEmpty
                    ? CustomScrollView(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        controller: controller,
                        scrollDirection: Axis.vertical,
                        slivers: [
                            SliverToBoxAdapter(
                                child: Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 8.0, top: 16),
                              child: Text(
                                args,
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                            )),
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
                                    var dateTime =
                                        DateTime.parse(ev.announceDate);
                                    var formate1 =
                                        "${dateTime.day}-${dateTime.month}-${dateTime.year}";
                                    return Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 0.2, color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: InkWell(
                                        customBorder: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        onTap: () {
                                          watch.moveToDetails(index, context);
                                          setState(() {});
                                        },
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Stack(
                                              alignment: Alignment.topRight,
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  child: Image.network(
                                                    // ignore: prefer_interpolation_to_compose_strings
                                                    'https://d2jcoi69vojtfw.cloudfront.net/' +
                                                        ev.cover,
                                                    errorBuilder: (context,
                                                        error, stackTrace) {
                                                      return const Text(
                                                          'unable to load image');
                                                      // width: 300,
                                                      // height: 200,
                                                      // fit: BoxFit.contain);
                                                    },
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            7,
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                                Material(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20)),
                                                    color: Colors.transparent,
                                                    child: IconButton(
                                                        onPressed: () async {
                                                          model.snackBarContext =
                                                              context;
                                                          id = watch
                                                              .posts[index].id;

                                                          listIndex = (await model
                                                                  .getFoldersByAnnounce(
                                                                      id))
                                                              .map((e) =>
                                                                  e.listId)
                                                              .toList();
                                                          watch
                                                              .modalBottomSheet(
                                                                  context:
                                                                      context,
                                                                  index: index,
                                                                  posts: ev);
                                                          index1 = index;

                                                          // readQovluqlar.getLists();
                                                          setState(() {});
                                                        },
                                                        icon: watchFavs
                                                                .map(
                                                                    (e) => e.id)
                                                                .contains(ev.id)
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
                                              padding: const EdgeInsets.only(
                                                  left: 4.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    "${ev.price} AZN",
                                                    style: const TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    ev.address.toString(),
                                                    style: const TextStyle(
                                                        fontSize: 11),
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    softWrap: false,
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  // ignore: prefer_interpolation_to_compose_strings
                                                  Text(
                                                    '${'${ev.roomCount} otaqli - ' + ev.space} m2',
                                                    style: const TextStyle(
                                                        fontSize: 11),
                                                  ),
                                                  const SizedBox(
                                                    height: 6,
                                                  ),
                                                  Text(
                                                    'Baki, $formate1',
                                                    style: const TextStyle(
                                                        color: Color.fromRGBO(
                                                            51, 51, 51, 0.6),
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
                            // evler.isEmpty
                            //     ? SliverToBoxAdapter(
                            //         child: Center(
                            //             child: Padding(
                            //           padding: EdgeInsets.all(30.0),
                            //           child: CircularProgressIndicator(
                            //             strokeWidth: 4,
                            //           ),
                            //         )),
                            //       )
                            //     : SliverToBoxAdapter(child: Text(''))
                          ])
                    : const Center(
                        child: Text(
                        'qovluq bosdur',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ))),
          ),
        ],
      ),
    )));
  }
}
