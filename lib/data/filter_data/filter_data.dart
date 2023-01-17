// import 'package:database_trial/domain/api_clients/filter_api/filter_api_client.dart';
// import 'package:flutter/material.dart';

// class Evler extends ChangeNotifier {
//   final apiClient = FilterApiClient();

//   var _posts = <dynamic>[];
//   List<dynamic> get posts => _posts;
//   var count = 0;
//   int counter = 0;
//   Future<void> reloadPosts() async {
//     try {
//       final posts = await apiClient.getHouses();
//       // final post = post1['announcesDto'];
//       apiClient.page++;
//       print(apiClient.page);
//       _posts += posts;
//       notifyListeners();
//     } catch (e) {}
//   }

//   // Future<void> getHouses() async {
//   //   try {
//   //     favorite = await apiVerificationClient.getHouses();
//   //     notifyListeners();
//   //   } catch (e) {
//   //     print('token expired');
//   //   }
//   // }

//   // Future<void> tokenAndRefresh() async {
//   //   await apiVerificationClient.tokenAndRefreshToken(
//   //       phone: '+994553826064', code: '1950');
//   // }

//   // Future<void> refreshToken() async {
//   //   await apiVerificationClient.refreshTokens();
//   //   notifyListeners();
//   // }

//   // // Future<void> getUser() async {
//   // //   Map = await apiVerificationClient.getUserDetails();
//   // // }

//   // Future<void> postsCounter() async {
//   //   final posts = await apiClient.getHousesCount();
//   //   count = posts;
//   //   notifyListeners();
//   // }

//   // FilterData() {
//   //   postsCounter();
//   //   reloadPosts();
//   //   getHouses();
//   //   // getFoldersByAnnounce(id);
//   //   // getUser();
//   //   // tokenAndRefresh();
//   //   // refreshToken();
//   // }

//   // void elanOnTap(int index, context) {
//   //   final int args = _posts[index].id;
//   //   Navigator.of(context).pushNamed('/main_screen/details', arguments: args);
//   //   counter = index;
//   //   notifyListeners();
//   // }

//   // void secilmislerelanOnTap(int index, context) {
//   //   final int args = favorite[index].id;
//   //   Navigator.of(context).pushNamed('/main_screen/details', arguments: args);
//   //   counter = index;
//   //   notifyListeners();
//   // }

//   // Future<List> getFoldersByAnnounce(id) async {
//   //   return await QovluqlarApiClient().getFolderById(id);
//   //   // getHouses();
//   //   notifyListeners();
//   // }

//   // Future<void> favouritesPostToDb(id) async {
//   //   await ApiVerificationClient().saveAndRemoveFromWishlist(id);
//   //   getHouses();
//   //   notifyListeners();
//   // }
//   // Future<void> logoutButton(BuildContext context) async {
//   //   await authService.logout();
//   //   Navigator.of(context).pushNamedAndRemoveUntil('/daxil', (_) => false);
//   // }
// }
