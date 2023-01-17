import 'package:database_trial/ui/secure_storage/secure_storage.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';

class RegistrationWidget extends StatelessWidget {
  const RegistrationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<EvlerSecurityStorage>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Center(
            child: Text(
          'Son addım',
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
                'Adınızı qeyd edin',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Colors.grey),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: TextField(
                  controller: model.nameTextController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(
                          color: Color.fromARGB(46, 158, 158, 158),
                        )),
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
                        onPressed: () => model.register(context),
                        child: const Text('Qeydiyyatdan keç'))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
