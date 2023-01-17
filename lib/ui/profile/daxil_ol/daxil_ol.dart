import 'package:database_trial/ui/secure_storage/secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class DaxilWidget extends StatelessWidget {
  const DaxilWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<EvlerSecurityStorage>();
    const secureStorage = FlutterSecureStorage();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Center(
            child: Text(
          'Daxil ol',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
        )),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 140),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Daxil olmaq üçün mobil nömrənizi yazın',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: TextField(
                  controller: model.numberTextController,
                  // maxLength: 12,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                        //Outline border type for TextFeild
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(
                          color: Color.fromARGB(46, 158, 158, 158),
                          // width: 0.5,
                        )),
                    // isDense: true,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IntrinsicHeight(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset('assets/images/Ellipse 18.png'),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              '+(994)',
                              style: TextStyle(fontSize: 17),
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: SvgPicture.asset(
                                    'assets/images/CaretDown.svg')),
                            const VerticalDivider(
                              width: 1,
                              thickness: 1,
                              color: Color.fromARGB(113, 158, 158, 158),
                            )
                          ],
                        ),
                      ),
                    ),
                    // prefixIconConstraints:
                    //     BoxConstraints(minWidth: 0, minHeight: 0),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(18, 18, 18, 24),
                child: Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(8)),
                    width: MediaQuery.of(context).size.width,
                    height: 44,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromRGBO(34, 186, 104, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        onPressed: () => model.sendSmsWidget(context),
                        child: const Text('Dəvam et'))),
              ),
              const Text(
                'Qeydiyyatdan keçərək İsfadəçi razılaşması və Məxfiliksiyasətini qəbul etdiyinizi təsdiq edirsiniz.',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
    // : HesabScreenWidget();
  }
}
