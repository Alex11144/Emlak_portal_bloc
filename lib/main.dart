import 'package:database_trial/bloc/bloc/search_reqest_bloc.dart';
import 'package:database_trial/check_auth.dart';
import 'package:database_trial/data/evler_data/evler_data.dart';
import 'package:database_trial/data/qovluqlar_data/qovluqlar_data.dart';
import 'package:database_trial/ui/axtaris/axtaris_birlesme.dart';
import 'package:database_trial/ui/bottomNavigationBar/bottom_navigation_bar.dart';
import 'package:database_trial/ui/bottomNavigationBar/cupertino_tab_scaffold.dart';
import 'package:database_trial/ui/deatils_screens/details_images/details_images.dart';
import 'package:database_trial/ui/deatils_screens/details_images/details_slider.dart';
import 'package:database_trial/ui/deatils_screens/details_screen.dart';
import 'package:database_trial/ui/evler/elanlarList/elanlar_list.dart';
import 'package:database_trial/ui/evler/evler.dart';
import 'package:database_trial/ui/profile/daxil_ol/daxil_ol.dart';
import 'package:database_trial/ui/profile/daxil_ol/hesab_screen.dart';
import 'package:database_trial/ui/profile/reegister/registration_page.dart';
import 'package:database_trial/ui/secilmisler/papkalar/papkalar_single.dart';
import 'package:database_trial/ui/secure_storage/secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';

import 'ui/profile/daxil_ol/code_screen.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => SatilanEvlerData()),
    ChangeNotifierProvider(create: (_) => EvlerSecurityStorage()),
    ChangeNotifierProvider(create: (_) => QovluqlarData()),
    // ChangeNotifierProvider(create: (_) => FilterData()),

    // ChangeNotifierProvider(create: (_) => QovluqlarSecureStorage()),

    // ChangeNotifierProvider(create: (_) => AuthModel()),

    // ChangeNotifierProvider(create: (_) => DetailsChangeNotifier())
  ], child: const MyApp()));
  // MultiBlocProvider(
  //   providers: [
  //     BlocProvider<SearchRequestBloc>(
  //       create: (context) => SearchRequestBloc(),
  //     )
  //   ],
  //   child: MyApp(),
  // );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const secureStorage = FlutterSecureStorage();

    // ApiVerificationClient().validateNumber();
    // ApiClient().getDetailsImages();
    return BlocProvider<SearchRequestBloc>(
      create: (context) => SearchRequestBloc(),
      child: MaterialApp(
          navigatorKey: navigatorKey,
          // color: Colors.white,
          title: 'Flutter Demo',
          theme: ThemeData(
            // fontFamily: 'San Francisco',
            primarySwatch: Colors.blue,
          ),
          // themeMode: ThemeMode.dark,
          routes: {
            'main_screen': (context) => const MainScreenWidget(),
            'cupertino_main': (context) => const CupertinoTabWidget(),
            'elanlar_list': (context) => const ElanlarWidget(),
            'verification': (context) => const CodeScreen(),
            'registration': (context) => const DaxilWidget(),
            'register_screen': (context) => const RegistrationWidget(),
            'cupertino_tab': (context) => const CupertinoTabWidget(),
            'hesab_screen': (context) => const HesabScreenWidget(),
            '/main_screen/details': (context) {
              final arguments = ModalRoute.of(context)?.settings.arguments;
              if (arguments is int) {
                return DetailsScreenWidget(
                  id: arguments,
                );
              } else {
                return const Text(
                  'data',
                  style: TextStyle(fontSize: 40),
                );
              }
            },
            '/main_screen/details/details_images': (context) {
              final arguments = ModalRoute.of(context)?.settings.arguments;

              if (arguments is List) {
                return DetailedImages(
                  images: arguments,
                );
              } else {
                return const Text(
                  'data',
                  style: TextStyle(fontSize: 40),
                );
              }
            },
            '/secilmisler/papkalar': (context) {
              final arguments = ModalRoute.of(context)?.settings.arguments;
              if (arguments is String) {
                return SinglePapkalar(
                  text: arguments,
                );
              } else {
                return const Text(
                  'data',
                  style: TextStyle(fontSize: 40),
                );
              }
            },
            '/main_screen/details/details_images/slider': (context) {
              final arguments = ModalRoute.of(context)?.settings.arguments;
              if (arguments is dynamic) {
                return DetailsImagesSlider(
                  images: arguments,
                );
              } else {
                return const Text(
                  'data',
                  style: TextStyle(fontSize: 40),
                );
              }
            },
          },
          // initialRoute: '/main_screen',
          home: CheckAuth()),
    );
  }
}
