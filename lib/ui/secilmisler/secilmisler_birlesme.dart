import 'package:database_trial/data/evler_data/evler_data.dart';
import 'package:database_trial/data/qovluqlar_data/qovluqlar_data.dart';
import 'package:database_trial/ui/secilmisler/appBarSecilmisler.dart';
import 'package:database_trial/ui/secilmisler/papkalar.dart';
import 'package:database_trial/ui/secilmisler/secilmis_elanlar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BirlesmisSecilmelerWidget extends StatefulWidget {
  const BirlesmisSecilmelerWidget({super.key});

  @override
  State<BirlesmisSecilmelerWidget> createState() =>
      _BirlesmisSecilmelerWidgetState();
}

class _BirlesmisSecilmelerWidgetState extends State<BirlesmisSecilmelerWidget> {
  bool tapped1 = true;
  bool tapped2 = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final model = context.watch<QovluqlarData>();
    final watch = context.watch<SatilanEvlerData>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 5, 16, 16),
          child: Column(
            children: [
              const Expanded(flex: 1, child: AppBarSecilmisler()),
              Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          // margin: EdgeInsets.fromLTRB(24, 10, 24, 10),
                          height: 40,
                          width: MediaQuery.of(context).size.width / 2 - 24,
                          // padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: tapped1
                                ? Border.all(width: 0)
                                : Border.all(width: 0.3, color: Colors.grey),
                          ),
                          // width: 185,
                          // height: 42,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                foregroundColor:
                                    tapped1 ? Colors.white : Colors.black,
                                backgroundColor: tapped1
                                    ? const Color.fromRGBO(34, 186, 104, 1)
                                    : Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              onPressed: () {
                                setState(() {});
                                tapped1 = true;
                                tapped2 = false;
                              },
                              child: const Text(
                                'Ümumi',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ))),
                      const SizedBox(
                        width: 8,
                      ),
                      Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width / 2 - 24,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: tapped2
                                ? Border.all(width: 0)
                                : Border.all(width: 0.2, color: Colors.grey),
                          ),
                          // width: 185,
                          // height: 42,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                foregroundColor:
                                    tapped2 ? Colors.white : Colors.black,
                                backgroundColor: tapped2
                                    ? const Color.fromRGBO(34, 186, 104, 1)
                                    : Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              onPressed: () {
                                setState(() {});
                                tapped2 = true;
                                tapped1 = false;
                                // model.getLists();
                              },
                              child: const Text(
                                'Papkalar',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ))),
                    ],
                  )),
              Expanded(
                  flex: 10,
                  child: tapped1
                      ? const SecilmisElanlarList()
                      : const PapkalarWidget()),
            ],
          ),
        ),
      ),
    );
  }
}
