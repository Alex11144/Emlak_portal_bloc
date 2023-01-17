import 'package:database_trial/bloc/bloc/search_reqest_bloc.dart';
import 'package:database_trial/data/evler_data/evler_data.dart';
import 'package:database_trial/domain/api_clients/api_client.dart';
import 'package:database_trial/domain/api_clients/filter_api/filter_api_client.dart';
import 'package:database_trial/ui/axtaris/axtaris_list_widget.dart';
import 'package:database_trial/ui/axtaris/button_entity/room_count_entity.dart';
import 'package:database_trial/ui/axtaris/kiraye.dart';
import 'package:database_trial/ui/evler/elanlarList/elanlar_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

bool isloading = true;

class AxtarisBirlesmeWidget extends StatefulWidget {
  const AxtarisBirlesmeWidget({super.key});

  @override
  State<AxtarisBirlesmeWidget> createState() => _AxtarisBirlesmeWidgetState();
}

class _AxtarisBirlesmeWidgetState extends State<AxtarisBirlesmeWidget> {
  bool tapped1 = true;
  bool tapped2 = false;
  final filter = FilterApiClient();
  final apiClient = ApiClient();
  @override
  Widget build(BuildContext context) {
    final watch = context.watch<SatilanEvlerData>();

    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: Colors.white,
      //   title: Text('Axtarış'),
      // ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 31.0),
                  child: Center(
                    child: Text('Axtarış',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500)),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    // shrinkWrap: true,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: tapped1
                                      ? Border.all(width: 0)
                                      : Border.all(
                                          width: 0.3, color: Colors.grey),
                                ),
                                width:
                                    MediaQuery.of(context).size.width / 2 - 24,
                                height: 42,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      foregroundColor:
                                          tapped1 ? Colors.white : Colors.black,
                                      backgroundColor: tapped1
                                          ? const Color.fromRGBO(
                                              34, 186, 104, 1)
                                          : Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        queryParameters.announceType = '2';
                                        // queryParameters.propertyType = '0';

                                        // queryParameters.currentFloor.clear();
                                        // queryParameters.roomCount.clear();
                                        // queryParameters.floorCount.clear();
                                        watch.posts.clear();
                                        watch.reloadPosts();
                                        // queryParameters.floorCount.clear();
                                        // queryParameters.roomCount.clear();
                                        // queryParameters.currentFloor.clear();
                                        // queryParameters.document = '0';
                                        // queryParameters.kredit = '0';

                                        tapped1 = true;
                                        tapped2 = false;
                                        // menzil = false;
                                        // yeni = false;
                                        // kohne = false;
                                        // evVilla = false;
                                      });
                                      watch.getSatilirMertebeCount();
                                    },
                                    child: const Text(
                                      'SATILIR',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ))),
                            const SizedBox(
                              width: 8,
                            ),
                            Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: tapped2
                                      ? Border.all(width: 0)
                                      : Border.all(
                                          width: 0.2, color: Colors.grey),
                                ),
                                width:
                                    MediaQuery.of(context).size.width / 2 - 24,
                                height: 42,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      foregroundColor:
                                          tapped2 ? Colors.white : Colors.black,
                                      backgroundColor: tapped2
                                          ? const Color.fromRGBO(
                                              34, 186, 104, 1)
                                          : Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        queryParameters.announceType = '1';
                                        // queryParameters.propertyType = '0';
                                        // queryParameters.currentFloor.clear();
                                        // queryParameters.floorCount.clear();
                                        // queryParameters.roomCount.clear();
                                        // queryParameters.currentFloor.clear();
                                        // queryParameters.document = '0';
                                        // queryParameters.kredit = '0';

                                        watch.posts.clear();
                                        watch.reloadPosts();
                                        tapped2 = true;
                                        tapped1 = false;
                                        // menzil = false;
                                        // yeni = false;
                                        // kohne = false;
                                        // evVilla = false;
                                      });
                                      watch.getSatilirMertebeCount();
                                    },
                                    child: const Text(
                                      'KİRAYƏ',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ))),
                          ],
                        ),
                        const Divider(
                          thickness: 0.7,
                          height: 30,
                        ),
                        const AxtarisListWidget(),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 44,
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromRGBO(34, 186, 104, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          elevation: 0),
                      onPressed: () {
                        Navigator.pushNamed(context, 'elanlar_list');
                        watch.posts.clear();
                        queryParameters.pageNumber = '1';
                        watch.reloadPosts();
                        setState(() {});
                      },
                      child: BlocBuilder<SearchRequestBloc, SearchRequestState>(
                        builder: (context, state) {
                          // print(state.count);

                          if (state is SearchReqestSuccess ||
                              state is SearchReqestInitial) {
                            return Text('Göstər ' +
                                '( ${watch.count.toString() + ' elan'} )');
                          } else {
                            return CircularProgressIndicator(
                              strokeWidth: 3,
                              color: Colors.white,
                            );
                          }
                        },
                      )),
                )
              ],
            )),
      ),
    );
  }
}
