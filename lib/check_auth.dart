import 'package:database_trial/data/evler_data/evler_data.dart';
import 'package:database_trial/ui/bottomNavigationBar/bottom_navigation_bar.dart';
import 'package:database_trial/ui/bottomNavigationBar/persistent_bottom_nav_bar.dart';
import 'package:database_trial/ui/profile/daxil_ol/daxil_ol.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';

import 'ui/bottomNavigationBar/cupertino_tab_scaffold.dart';

class CheckAuth extends StatefulWidget {
  @override
  State<CheckAuth> createState() => _CheckAuthState();
}

class _CheckAuthState extends State<CheckAuth> {
  @override
  void initState() {
    super.initState();
    final evlerData = Provider.of<SatilanEvlerData>(context, listen: false);
    evlerData.snackBarContext = context;
  }

  @override
  final secureStorage = const FlutterSecureStorage();

  Widget build(BuildContext context) {
    return FutureBuilder(
        future: secureStorage.read(key: 'token'),
        builder: (BuildContext context, AsyncSnapshot<String?> token) {
          return Scaffold(
              body: (token.hasData && token.data != null)
                  ? MainScreenWidget()
                  : DaxilWidget());
        });
  }
}
