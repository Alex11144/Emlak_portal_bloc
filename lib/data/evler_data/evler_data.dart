import 'package:database_trial/domain/api_clients/api_client.dart';
import 'package:database_trial/domain/api_clients/api_verif_client.dart';
import 'package:database_trial/domain/api_clients/filter_api/filter_api_client.dart';
import 'package:database_trial/domain/api_clients/qovluqlar_api_client.dart';
import 'package:database_trial/ui/axtaris/axtaris_birlesme.dart';
import 'package:database_trial/ui/axtaris/button_entity/room_count_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:share_plus/share_plus.dart';

class SatilanEvlerData extends ChangeNotifier {
  final apiClient = ApiClient();
  final filterApiClient = FilterApiClient();

  // final authService = AuthService();
  var favorite = [];
  var getFolders = [];

  String seherName = 'Baki';
  bool menzil = false;
  bool yeni = false;
  bool kohne = false;
  bool evVilla = false;
  var regionId = [];
  var metros = [];
  var seherler = [];
  var nisangahId = [];
  var nisangah = [];
  var seherler2 = [];
  String cityId = '1';
  var regions = [];
  var settlemetDto = [];
  var settlementDtoId = [];
  final secureStorage = const FlutterSecureStorage();
  final apiVerificationClient = ApiVerificationClient();
  var _posts = <dynamic>[];
  List<dynamic> get posts => _posts;
  var count = 0;
  int counter = 0;
  int pageNum = 1;
  var Map = {};
  late BuildContext snackBarContext;
  var lastForSale = [];
  var lastForRent = [];
  // var _favorite = <dynamic>[];
  // List<dynamic> get favorite => _favorite;
  Future<void> reloadPosts() async {
    try {
      // var page = int.parse(queryParameters.pageNumber);
      final posts = await filterApiClient.getFilteredHouses();
      // final post = post1['announcesDto'];
      // page++;
      pageNum++;
      queryParameters.pageNumber = pageNum.toString();
      // filterApiClient.page++;
      _posts += posts;
      notifyListeners();
    } catch (e) {}
  }

  Future<void> lastAnnouncesForSale() async {
    try {
      final posts = await apiClient.announcesForSale();
      lastForSale = posts;
      notifyListeners();
    } catch (e) {}
  }

  Future<void> lastAnnouncesForRent() async {
    try {
      final posts = await apiClient.announcesForRent();
      lastForRent = posts;
      notifyListeners();
    } catch (e) {}
  }

  Future<void> getHouses() async {
    try {
      favorite = await apiVerificationClient.getHouses();
      notifyListeners();
    } catch (e) {}
  }

  Future<void> getSettlementDto() async {
    try {
      settlemetDto = await filterApiClient.settlements();
      notifyListeners();
    } catch (e) {}
  }

  Future<bool> isTokenLoaded() async {
    String? token = await secureStorage.read(key: 'token');

    if (token != null) {
      return true;
    } else {
      return false;
    }
  }

  // Future<void> tokenAndRefresh() async {
  //   await apiVerificationClient.tokenAndRefreshToken(
  //       phone: '+994553826064', code: '1950');
  // }

  Future<void> refreshToken() async {
    await apiVerificationClient.refreshTokens();
    notifyListeners();
  }

  // Future<void> getRegionsAndSettlements() async {
  //   try {
  //     regionId = await filterApiClient.regionsAndSettlements();
  //     notifyListeners();
  //   } catch (e) {}
  // }

  Future<void> getMetros() async {
    try {
      metros = await filterApiClient.metros();
      notifyListeners();
    } catch (e) {}
  }

  Future<void> getSettlements() async {
    try {
      regions = await filterApiClient.regionsAndSettlements();
      notifyListeners();
    } catch (e) {}
  }

  // Future<void> getsettlementsDto() async {
  //   try {
  //     regionId = regions[''];
  //     notifyListeners();
  //   } catch (e) {}
  // }
  Future<void> getNisangah() async {
    try {
      nisangah = await filterApiClient.nisangah();
      notifyListeners();
    } catch (e) {}
  }

  Future<void> getSehrler() async {
    try {
      seherler = await filterApiClient.seherler();
      notifyListeners();
    } catch (e) {}
  }

  SatilanEvlerData() {
    // postsCounter();
    reloadPosts();
    getSatilirMertebeCount();
    getHouses();
    lastAnnouncesForSale();
    lastAnnouncesForRent();
    // getRegionsAndSettlements();
    getMetros();
    getNisangah();
    getSehrler();
    getSettlements();
    getSettlementDto();
    // filterApiClient.getMertebeSatilirCount();
    // getFoldersByAnnounce(id);
    // getUser();
    // tokenAndRefresh();
    // refreshToken();
  }

  void elanOnTap(int index, context) {
    final int args = _posts[index].id;
    Navigator.of(context).pushNamed('/main_screen/details', arguments: args);
    counter = index;
    notifyListeners();
  }

  void satilanEvlerOnTap(int index, context) {
    final int args = lastForSale[index].id;
    Navigator.of(context).pushNamed('/main_screen/details', arguments: args);
    counter = index;
    notifyListeners();
  }

  void kirayeEvlerOnTap(int index, context) {
    final int args = lastForRent[index].id;
    Navigator.of(context).pushNamed('/main_screen/details', arguments: args);
    counter = index;
    notifyListeners();
  }

  void secilmislerelanOnTap(int index, context) {
    final int args = favorite[index].id;
    Navigator.of(context).pushNamed('/main_screen/details', arguments: args);
    counter = index;
    notifyListeners();
  }

  void shareButton() {
    Share.share('text');
  }

  Future<List> getFoldersByAnnounce(id) async {
    try {
      return await QovluqlarApiClient().getFolderById(id);
    } catch (e) {}
    return [];
    notifyListeners();
  }

  Future<void> getSatilirMertebeCount() async {
    final posts = await filterApiClient.getMertebeSatilirCount();
    try {
      count = posts;
      // isloading = true;
      notifyListeners();
    } catch (e) {}
  }

  Future<void> favouritesPostToDb(id) async {
    await ApiVerificationClient().saveAndRemoveFromWishlist(id);

    await getHouses();
    notifyListeners();
  }

  // Future<void> logoutButton(BuildContext context) async {
  //   await authService.logout();
  //   Navigator.of(context).pushNamedAndRemoveUntil('/daxil', (_) => false);
  // }
}
