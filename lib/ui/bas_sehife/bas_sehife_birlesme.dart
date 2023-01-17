import 'package:database_trial/data/evler_data/evler_data.dart';
import 'package:database_trial/ui/bas_sehife/appbar.dart';
import 'package:database_trial/ui/bas_sehife/neticeler.dart';
import 'package:database_trial/ui/bas_sehife/satilan_son_elanlar.dart';
import 'package:database_trial/ui/evler/appbar/son_elanlar.dart';
import 'package:database_trial/ui/evler/elanlarList/elanlar_list.dart';
import 'package:database_trial/ui/evler/son%20elanar/neticeler-widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/qovluqlar_data/qovluqlar_data.dart';

class SonSatilnaBirlesmeWidget extends StatelessWidget {
  const SonSatilnaBirlesmeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final watch = context.watch<SatilanEvlerData>();
    final modelWatch = context.watch<QovluqlarData>();

    return Scaffold(
      // key: scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 5, 16, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(flex: 1, child: AppBarSonElanlar()),
              // Expanded(flex: 1, child: NeticelerForLastAnnouncesWidget()),
              watch.lastForSale != null && watch.lastForRent != null
                  ? Expanded(flex: 10, child: SatilanSonElanlarList())
                  : Expanded(
                      flex: 10,
                      child: Center(child: CircularProgressIndicator()))
              //  Expanded(
              //     flex: 10,
              //     child: Column(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       // crossAxisAlignment: CrossAxisAlignment.center,
              //       children: [
              //         Text(
              //           'Qovluqlardan isitifade etmek ucun hesaba giris edin',
              //           textAlign: TextAlign.center,
              //           style: TextStyle(
              //               fontSize: 20, fontWeight: FontWeight.w400),
              //         ),
              //         SizedBox(
              //           height: 15,
              //         ),
              //         Container(
              //             // padding: EdgeInsets.all(0),
              //             decoration: BoxDecoration(
              //                 borderRadius: BorderRadius.circular(8)),
              //             width: MediaQuery.of(context).size.width,
              //             height: 44,
              //             child: ElevatedButton(
              //                 style: ElevatedButton.styleFrom(
              //                   // padding: EdgeInsets.all(0),
              //                   backgroundColor:
              //                       const Color.fromRGBO(34, 186, 104, 1),
              //                   shape: RoundedRectangleBorder(
              //                     borderRadius: BorderRadius.circular(8.0),
              //                   ),
              //                 ),
              //                 onPressed: () {
              //                   // Navigator.pop(context);
              //                 },
              //                 child: const Text('Login')))
              //       ],
              //     ),
              //   )
            ],
          ),
        ),
      ),
    );
  }
}
