import 'package:database_trial/data/evler_data/evler_data.dart';
import 'package:database_trial/ui/secure_storage/secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class HesabScreenWidget extends StatefulWidget {
  const HesabScreenWidget({super.key});

  @override
  State<HesabScreenWidget> createState() => _HesabScreenWidgetState();
}

class _HesabScreenWidgetState extends State<HesabScreenWidget> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final modelWatch = context.watch<EvlerSecurityStorage>();
    final model = context.watch<SatilanEvlerData>().Map;
    final securityStorage = const FlutterSecureStorage();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false, // Don't show the leading button
        titleSpacing: 0,

        backgroundColor: Colors.white,
        elevation: 0,
        // titleSpacing: 900,
        title: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 12, 16, 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 21,
                backgroundColor: const Color.fromRGBO(235, 155, 0, 0.1),
                child: IconButton(
                    padding: const EdgeInsets.all(0),
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      'assets/images/bell_svg.svg',
                      width: 50,
                      height: 50,
                    )),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 120.0),
                child: Text(
                  'Profil',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: FutureBuilder(
            future: Future.wait([
              securityStorage.read(key: 'number'),
              securityStorage.read(key: 'name')
            ]),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            SvgPicture.asset('assets/images/UserCircle.svg'),
                            Column(
                              children: [
                                Text(
                                  snapshot.data![1]!,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text('(+994) ' +
                                    snapshot.data![0]!.substring(4, 13)),
                              ],
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            Column(
                              children: [
                                Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        border: Border.all(
                                            color: const Color.fromRGBO(
                                                238, 238, 238, 1))),
                                    width: 345,
                                    height: 48,
                                    child: ElevatedButton.icon(
                                        style: ElevatedButton.styleFrom(
                                          elevation: 0,
                                          backgroundColor: const Color.fromRGBO(
                                              255, 255, 255, 1),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                          ),
                                        ),
                                        icon: SvgPicture.asset(
                                            'assets/images/Gear.svg'),
                                        onPressed: () {},
                                        label: const Text('Ayarlar',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500)))),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      border: Border.all(
                                          color: const Color.fromRGBO(
                                              238, 238, 238, 1))),
                                  width: 345,
                                  height: 48,
                                  child: ElevatedButton.icon(
                                      style: ElevatedButton.styleFrom(
                                        elevation: 0,
                                        backgroundColor: const Color.fromRGBO(
                                            255, 255, 255, 1),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                        ),
                                      ),
                                      icon: SvgPicture.asset(
                                          'assets/images/HeartStraightLogin.svg'),
                                      onPressed: () {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                content: Stack(
                                                  // overflow: Overflow.visible,
                                                  children: <Widget>[
                                                    Positioned(
                                                      right: -40.0,
                                                      top: -40.0,
                                                      child: InkResponse(
                                                        onTap: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        child:
                                                            const CircleAvatar(
                                                          child:
                                                              Icon(Icons.close),
                                                          backgroundColor:
                                                              Colors.red,
                                                        ),
                                                      ),
                                                    ),
                                                    Form(
                                                      key: _formKey,
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: <Widget>[
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child:
                                                                TextFormField(),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child:
                                                                TextFormField(),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child:
                                                                ElevatedButton(
                                                              child: const Text(
                                                                  "Submitß"),
                                                              onPressed: () {
                                                                if (_formKey
                                                                    .currentState!
                                                                    .validate()) {
                                                                  _formKey
                                                                      .currentState
                                                                      ?.save();
                                                                }
                                                              },
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            });
                                      },
                                      label: const Text(
                                        'Seçilmişlər',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      )),
                                )
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8)),
                              width: MediaQuery.of(context).size.width,
                              height: 44,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    backgroundColor: const Color.fromRGBO(
                                        238, 238, 238, 0.7),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                  onPressed: () {
                                    modelWatch.logout(context);
                                    setState(() {});
                                  },
                                  child: const Text(
                                    'Çıxış',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ))),
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return const CircularProgressIndicator();
              }
            }),
      ),
    );
  }
}
