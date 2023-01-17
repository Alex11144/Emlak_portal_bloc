import 'dart:ui';

import 'package:database_trial/data/qovluqlar_data/qovluqlar_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../data/evler_data/evler_data.dart';
import '../../../domain/api_clients/api_verif_client.dart';
import '../../../domain/api_clients/qovluqlar_api_client.dart';

class QovluqYaratDialog extends StatefulWidget {
  const QovluqYaratDialog({super.key});

  @override
  State<QovluqYaratDialog> createState() => _QovluqYaratDialogState();
}

class _QovluqYaratDialogState extends State<QovluqYaratDialog> {
  final _apiClient = QovluqlarApiClient();

  final _postsApi = ApiVerificationClient();

  @override
  Widget build(BuildContext context) {
    final qovluqlarCount =
        Provider.of<SatilanEvlerData>(context, listen: false).favorite;
    final model = context.watch<SatilanEvlerData>();
    final watch = context.watch<QovluqlarData>();

    final QovluqApi = QovluqlarApiClient();
    return SafeArea(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Scaffold(
          backgroundColor: Colors.transparent.withOpacity(0.3),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: SvgPicture.asset('assets/images/ArrowLeft.svg')),
                const SizedBox(
                  height: 20,
                ),
                AlertDialog(
                  insetPadding: const EdgeInsets.all(0),
                  actionsPadding: const EdgeInsets.all(0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  title: const Text('Secilmislər papkasi'),
                  scrollable: true,
                  content: TextField(
                    // scrollPadding: EdgeInsets.all(0),
                    autofocus: true,
                    controller: _apiClient.nameQovluqTextController,
                    // maxLength: 12,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                      hintText: 'qovluq adi',
                      border: OutlineInputBorder(
                          //Outline border type for TextFeild
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(
                            color: Color.fromARGB(46, 158, 158, 158),
                            // width: 0.5,
                          )),
                      // isDense: true,

                      // prefixIconConstraints:
                      //     BoxConstraints(minWidth: 0, minHeight: 0),
                    ),
                  ),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
                      child: Container(
                          // padding: EdgeInsets.all(0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8)),
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
                              onPressed: () async {
                                await _apiClient.createList();
                                watch.getLists();
                                setState(() {});

                                Navigator.pop(context);
                              },
                              child: const Text('Əlavə et'))),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
