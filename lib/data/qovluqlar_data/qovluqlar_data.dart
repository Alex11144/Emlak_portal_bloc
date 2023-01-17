import 'package:another_flushbar/flushbar.dart';
import 'package:database_trial/domain/api_clients/api_verif_client.dart';
import 'package:database_trial/domain/api_clients/qovluqlar_api_client.dart';
import 'package:database_trial/ui/evler/elanlarList/elanlar_list.dart';
import 'package:database_trial/ui/profile/daxil_ol/daxil_ol.dart';
import 'package:database_trial/ui/secilmisler/papkalar/qovluq_yarat_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../evler_data/evler_data.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class QovluqlarData extends ChangeNotifier {
  // final qovluqSecurity = QovluqlarSecureStorage();
  List lists = [];
  final _apiClient = QovluqlarApiClient();
  final _postsApi = ApiVerificationClient();

  bool isCheckedSingle = false;
  // List secilmisler = [];
  QovluqlarData() {
    getLists();

    // isChecked = List<bool>.filled(lists.length, false);
  }

  void modalBottomSheet(
      {required BuildContext context,
      required int index,
      required,
      required var posts}) {
    final qovluqlarCount =
        Provider.of<SatilanEvlerData>(context, listen: false).favorite;
    final model = Provider.of<SatilanEvlerData>(context, listen: false);
    final QovluqApi = QovluqlarApiClient();

    // List<bool> isChecked = [false, false, false, false, false];
    showModalBottomSheet(
        isScrollControlled: true,
        // backgroundColor: Color.fromRGBO(
        //     41, 114, 253, 0.5),
        context: model.snackBarContext,
        builder: (context) {
          return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) => Container(
              decoration: BoxDecoration(
                // color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              height: MediaQuery.of(context).size.height * 0.7,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Qovluqlar',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        TextButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.0),
                              )),
                              backgroundColor: MaterialStateProperty.all(
                                  const Color.fromRGBO(0, 80, 235, 0.1))),
                          onPressed: () {
                            Navigator.of(context).push(PageRouteBuilder(
                                opaque: false,
                                pageBuilder: (BuildContext context, _, __) =>
                                    const QovluqYaratDialog()));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              ImageIcon(AssetImage(
                                  'assets/images/foldersBottom.png')),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                "Qovluq yarat",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color.fromRGBO(0, 80, 235, 1),
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: CheckboxListTile(
                                tileColor:
                                    model.favorite.map((e) => e.id).contains(id)
                                        ? const Color.fromRGBO(0, 80, 235, 0.1)
                                        : Colors.white,
                                checkboxShape: const CircleBorder(),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                // selectedTileColor: Colors.red,
                                title: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(16, 0, 16, 0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Ümumi',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                            color: model.favorite
                                                    .map((e) => e.id)
                                                    .contains(id)
                                                ? const Color.fromRGBO(
                                                    41, 114, 253, 1)
                                                : Colors.black),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            qovluqlarCount.length.toString() +
                                                ' (elan)',
                                            style: const TextStyle(
                                                color: Colors.grey,
                                                fontSize: 14),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                checkColor: Colors.white,
                                value:
                                    model.favorite.map((e) => e.id).contains(id)
                                        ? isCheckedSingle = true
                                        : isCheckedSingle = false,

                                onChanged: (bool? value) async {
                                  await model.favouritesPostToDb(id);
                                  //  model.getHouses();
                                  // model.favorite = await _postsApi.getHouses();
                                  getLists();
                                  setState(() {});
                                  notifyListeners();
                                },
                              ),
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: lists.length,
                              itemBuilder: (BuildContext context, int index) {
                                // isChecked.length = 5;
                                final list = List.filled(lists.length, false);

                                var qovluqlar = lists[index];

                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 10.0),
                                  child: CheckboxListTile(
                                    tileColor: listIndex
                                            .contains(qovluqlar.listId)
                                        ? const Color.fromRGBO(0, 80, 235, 0.1)
                                        : Colors.white,
                                    checkboxShape: const CircleBorder(),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                    // selectedTileColor: Colors.red,
                                    title: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          16, 0, 16, 0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            qovluqlar.listName,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                                color: listIndex.contains(
                                                        qovluqlar.listId)
                                                    ? const Color.fromRGBO(
                                                        41, 114, 253, 1)
                                                    : Colors.black),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                qovluqlar.announceCount
                                                        .toString() +
                                                    ' (elan)',
                                                style: const TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 14),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    // tristate: true,
                                    checkColor: Colors.white,
                                    // fillColor:
                                    //     MaterialStateProperty.all(
                                    //         Colors.blue),
                                    value: listIndex.contains(qovluqlar.listId)
                                        ? list[index] = true
                                        : list[index] = false,

                                    onChanged: (bool? value) {
                                      setState(() {
                                        if (listIndex
                                            .contains(qovluqlar.listId)) {
                                          listIndex.remove(qovluqlar.listId);
                                          // list[index] = false;
                                        } else {
                                          listIndex.add(qovluqlar.listId);
                                          // isChecked = value!;
                                          // list[index] = true;
                                        }
                                      });

                                      getLists();
                                      notifyListeners();
                                    },
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 44,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              backgroundColor:
                                  const Color.fromRGBO(34, 186, 104, 1)),
                          onPressed: () {
                            setState(() {
                              QovluqApi.addOrRemoveFromList(
                                id,
                                listIndex,
                              );
                              // _postsApi.saveAndRemoveFromWishlist(id);

                              getLists();
                            });

                            // isCheckedSingle = true;

                            notifyListeners();
                            // snackBarContext = context;
                            Navigator.of(context).pop();
                            _FlashBar(
                                context: model.snackBarContext,
                                index: index,
                                posts: posts);
                          },
                          child: const Text('Əlavə et')),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  void alertDialogIfNotLogged(context) {
    showDialog(
        context: context,
        builder: ((context) => AlertDialog(
              insetPadding: EdgeInsets.all(20),
              content: Container(
                width: MediaQuery.of(context).size.width - 16,
                height: 40,
                child: Text(
                  'Qovluqlardan isitifade etmek ucun hesaba giris edin',
                  textAlign: TextAlign.center,
                ),
              ),
              actions: [
                Container(
                    // padding: EdgeInsets.all(0),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(8)),
                    width: MediaQuery.of(context).size.width,
                    height: 44,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          // padding: EdgeInsets.all(0),
                          backgroundColor:
                              const Color.fromRGBO(34, 186, 104, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Login')))
              ],
            )));
  }

  void _FlashBar(
      {required BuildContext context, required int index, required var posts}) {
    // snackBarContext = context;
    Flushbar(
      padding: EdgeInsets.all(24),
      // boxShadows: [
      //   BoxShadow(
      //       color: Color.fromRGBO(0, 0, 0, 0.05),
      //       offset: Offset(3, 5),
      //       blurRadius: 8,
      //       spreadRadius: 3)
      // ],
      margin: const EdgeInsets.only(
        bottom: 8,
      ),
      // padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
      borderRadius: BorderRadius.circular(16),
      backgroundColor: Colors.blue.shade100.withOpacity(1),
      // backgroundGradient: LinearGradient(
      //     // transform: ,
      //     // begin: Alignment.bottomLeft,
      //     // end: Alignment.topRight,
      //     colors: [
      //       Color.fromRGBO(41, 114, 253, 0.9),
      //     ]),
      maxWidth: 343,
      // barBlur: 20,
      message: 'Əməliyyat uğurlu oldu!',
      duration: Duration(seconds: 2),
      flushbarPosition: FlushbarPosition.BOTTOM,
      // title: 'Əməliyyat uğurlu oldu!',
      messageColor: Colors.black,
      messageSize: 16,
      mainButton: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
        height: 40,
        width: 122,
        child: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: Color.fromRGBO(234, 241, 255, 1),
                  // Color.fromRGBO(0, 80, 235, 0.1),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8))),
              onPressed: () {
                modalBottomSheet(context: context, index: index, posts: posts);
              },
              child: Text(
                'Dəyişmək',
                style: TextStyle(
                    color: Color.fromRGBO(0, 80, 235, 1),
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              )),
        ),
      ),
    )..show(context);
  }

  Future<void> getLists() async {
    try {
      lists = await _apiClient.showLists();
      notifyListeners();
    } catch (e) {}
  }

  final apiClient = QovluqlarApiClient();

  var _posts = <dynamic>[];
  List<dynamic> get posts => _posts;

  Future<void> reloadPosts(index) async {
    try {
      final posts = await apiClient.getHouses(lists[index].listId);
      // final post = post1['announcesDto'];
      // apiClient.page++;
      notifyListeners();
      _posts = posts;
      notifyListeners();
      // _posts += posts;
    } catch (e) {}
  }

  void elanOnTap(int index, context) {
    final String args = lists[index].listName;
    Navigator.of(context).pushNamed('/secilmisler/papkalar', arguments: args);
    // counter = index;
    notifyListeners();
  }

  void moveToDetails(int index, context) {
    final int args = _posts[index].id;
    Navigator.of(context).pushNamed('/main_screen/details', arguments: args);
    // counter = index;
    notifyListeners();
  }
}
