import 'package:database_trial/ui/secure_storage/secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

class CodeScreen extends StatelessWidget {
  const CodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<EvlerSecurityStorage>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Padding(
          padding: EdgeInsets.only(left: 40.0),
          child: Text(
            'SMS kod təsdiqləmə',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 140),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'SMS vasitəsilə telefon nömrənizə göndərilən kodu daxil edin',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Form(
                  // key: formKey,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 30),
                      child: PinCodeTextField(
                        appContext: context,
                        autoDisposeControllers: false,
                        // backgroundColor: Colors.transparent,
                        pastedTextStyle: TextStyle(
                          color: Colors.green.shade600,
                          fontWeight: FontWeight.bold,
                        ),
                        length: 4,
                        // obscureText: true,
                        // obscuringCharacter: '*',
                        // obscuringWidget: const FlutterLogo(
                        //   size: 24,
                        // ),
                        blinkWhenObscuring: true,
                        animationType: AnimationType.fade,
                        validator: (v) {
                          if (v!.length < 3) {
                            return "I'm from validator";
                          } else {
                            return null;
                          }
                        },
                        pinTheme: PinTheme(
                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(5),
                            fieldHeight: 50,
                            fieldWidth: 40,
                            inactiveColor: Colors.transparent,
                            selectedColor: Colors.white,
                            activeFillColor: Colors.white,
                            selectedFillColor: Colors.white,
                            inactiveFillColor: Colors.white),
                        cursorColor: Colors.black,
                        animationDuration: const Duration(milliseconds: 300),
                        enableActiveFill: true,
                        // errorAnimationController: errorController,
                        controller: model.codeTextController,
                        keyboardType: TextInputType.number,
                        boxShadows: const [
                          BoxShadow(
                            offset: Offset(0, 1),
                            color: Colors.black12,
                            blurRadius: 10,
                          )
                        ],
                        onCompleted: (v) {
                          debugPrint("Completed");
                        },
                        // onTap: () {
                        //   print("Pressed");
                        // },
                        onChanged: (value) {
                          debugPrint(value);
                        },
                        beforeTextPaste: (text) {
                          debugPrint("Allowing to paste $text");
                          return true;
                        },
                      )),
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
                        onPressed: () => model.auth(context),
                        child: const Text('Təsdiqlə'))),
              ),
              const Text(
                '90 saniyə qalıb',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
