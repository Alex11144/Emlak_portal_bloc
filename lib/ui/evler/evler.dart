import 'package:database_trial/ui/evler/appbar/son_elanlar.dart';
import 'package:database_trial/ui/evler/elanlarList/elanlar_list.dart';
import 'package:database_trial/ui/evler/son%20elanar/neticeler-widget.dart';
import 'package:flutter/material.dart';

import '../../data/qovluqlar_data/qovluqlar_data.dart';

class ElanlarWidget extends StatelessWidget {
  const ElanlarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 5, 16, 16),
          child: Column(
            children: const [
              Expanded(flex: 1, child: SonElanlar()),
              Expanded(flex: 1, child: NeticelerWidget()),
              Expanded(flex: 10, child: ElanlarList()),
            ],
          ),
        ),
      ),
    );
  }
}
