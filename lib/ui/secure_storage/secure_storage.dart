import 'dart:async';

import 'package:database_trial/data/evler_data/evler_data.dart';
import 'package:database_trial/data/qovluqlar_data/qovluqlar_data.dart';
import 'package:database_trial/domain/api_clients/api_client.dart';
import 'package:database_trial/domain/api_clients/api_verif_client.dart';
import 'package:database_trial/domain/api_clients/filter_api/filter_api_client.dart';
import 'package:database_trial/main.dart';
import 'package:database_trial/ui/bottomNavigationBar/cupertino_tab_scaffold.dart';
import 'package:database_trial/ui/evler/elanlarList/elanlar_list.dart';
import 'package:database_trial/ui/profile/daxil_ol/code_screen.dart';
import 'package:database_trial/ui/profile/daxil_ol/daxil_ol.dart';
import 'package:database_trial/ui/profile/reegister/registration_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class EvlerSecurityStorage extends ChangeNotifier {
  final secureStorage = const FlutterSecureStorage();
  final evlerApi = ApiClient();
  final _apiClient = ApiVerificationClient();
  final _apiClientForFilter = FilterApiClient();
  TextEditingController numberTextController =
      TextEditingController(text: '553826067');
  TextEditingController codeTextController =
      TextEditingController(text: '1950');
  TextEditingController nameTextController = TextEditingController();

  // String? sessionId = null;

  Future<void> auth(BuildContext context) async {
    // final code = codeTextController.text;
    // final number = '+994' + numberTextController.text;
    final modelQovluq = context.read<QovluqlarData>();
    final evlerData = Provider.of<SatilanEvlerData>(context, listen: false);

    // await secureStorage.write(key: 'number', value: number);
    // await secureStorage.write(key: 'code', value: code);
    await _apiClient.validateNumber();
    // favorite = await _apiClient.getHouses();
    evlerData.getSatilirMertebeCount();

    evlerData.lastAnnouncesForSale();
    evlerData.lastAnnouncesForRent();
    evlerData.getMetros();
    evlerData.getNisangah();
    evlerData.getSehrler();
    evlerData.getSettlementDto();
    evlerData.getSettlements();
    modelQovluq.getLists();
    evlerData.getHouses();
    notifyListeners();

    try {
      if (await secureStorage.read(key: 'isValidUser') == 'true') {
        (Navigator.of(context).pushNamed('main_screen'));
        // Navigator.of(context).push(
        //     MaterialPageRoute(builder: ((context) => CupertinoTabWidget())));
      } else {
        (Navigator.of(context).pushNamed('register_screen'));
        // Navigator.of(context).push(
        //     MaterialPageRoute(builder: ((context) => RegistrationWidget())));
      }
      // (Navigator.of(context).pushNamed('hesab_screen'));

      // setSessionId(sessionId);
    } catch (e) {}
    // print(sessionId);
    // (Navigator.of(context).pushNamed('hesab_screen'));

    // if (await secureStorage.containsKey(key: 'number') == true) {
    //   (Navigator.of(context).pushNamed('hesab_screen'));
    // } else {
    //   (Navigator.of(context).pushNamed('register_screen'));
    // }
    // _apiClient.getHouses();
    // notifyListeners();
  }

  Future<void> register(BuildContext context) async {
    final name = nameTextController.text;
    final evlerData = Provider.of<SatilanEvlerData>(context, listen: false);
    final modelQovluq = Provider.of<QovluqlarData>(context, listen: false);

    // await secureStorage.read(key: 'userId');
    await secureStorage.write(key: 'name', value: name);
    await _apiClient.registerUser();
    // favorite = await _apiClient.getHouses();
    evlerData.getSatilirMertebeCount();

    evlerData.lastAnnouncesForSale();
    evlerData.lastAnnouncesForRent();
    evlerData.getMetros();
    evlerData.getNisangah();
    evlerData.getSehrler();
    evlerData.getSettlementDto();
    evlerData.getSettlements();
    modelQovluq.getLists();
    notifyListeners();
    Navigator.pushNamed(context, 'main_screen');
    // Navigator.of(context)
    //     .push(MaterialPageRoute(builder: ((context) => CupertinoTabWidget())));
    // (Navigator.of(context).pushNamed('hesab_screen'));
  }

  Future<void> sendSmsWidget(BuildContext context) async {
    final number = '+994' + numberTextController.text;
    // final code = codeTextController.text;
    await secureStorage.write(key: 'number', value: number);
    // final code = codeTextController.text;
    _apiClient.sendSms();
    // await secureStorage.write(key: 'number', value: number);

    // await secureStorage.write(key: 'code', value: code);
    precachePicture(
        ExactAssetPicture(SvgPicture.svgStringDecoderBuilder,
            'assets/images/successfulVerif.svg'),
        null);
    notifyListeners();
    (Navigator.of(context).pushNamed('verification'));
    // Navigator.of(context)
    //     .push(MaterialPageRoute(builder: ((context) => CodeScreen())));
  }

  Future<void> logout(BuildContext context) async {
    final model = context.read<SatilanEvlerData>().favorite;
    final modelQovluq = context.read<QovluqlarData>().lists;
    final evlerData = Provider.of<SatilanEvlerData>(context, listen: false);
    await secureStorage.delete(key: 'token');

    evlerData.favorite.clear();
    // notifyListeners();

    modelQovluq.clear();
    evlerData.lastForRent.clear();
    evlerData.lastForSale.clear();
    evlerData.metros.clear();
    evlerData.nisangah.clear();
    evlerData.settlemetDto.clear();
    evlerData.regions.clear();
    evlerData.seherler.clear();
    evlerData.count = 0;

    notifyListeners();
    // model.getHouses();
    // notifyListeners();

    (Navigator.of(context).pushNamed('registration'));
    // Navigator.of(context)
    //     .push(MaterialPageRoute(builder: ((context) => MyApp())));
    // Navigator.pop(context);
  }

  Future<String?> getSessionId() async {
    return await secureStorage.read(key: 'token');
  }

  Future<void> setSessionId(String value) async {
    await secureStorage.write(key: 'token', value: value);
  }
}
