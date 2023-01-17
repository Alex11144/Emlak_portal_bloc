import 'package:database_trial/ui/axtaris/list_tile/list_tile_nisangah.dart';
import 'package:database_trial/ui/axtaris/list_tile/list_tile_settlements.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../data/evler_data/evler_data.dart';
import '../list_tile/list_tile-entity.dart';

class NisangahlarLists extends StatefulWidget {
  const NisangahlarLists({super.key});

  @override
  State<NisangahlarLists> createState() => _NisangahlarListsState();
}

class _NisangahlarListsState extends State<NisangahlarLists> {
  List<bool> _isSelected = [true, false, false];
  bool isChecked = false;
// Future<void> lists(){

// }

  @override
  Widget build(BuildContext context) {
    final watch = context.watch<SatilanEvlerData>();

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 21,
                    backgroundColor: const Color.fromRGBO(235, 155, 0, 0.1),
                    child: IconButton(
                        padding: const EdgeInsets.all(0),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Image.asset(
                          'assets/images/arrow_back.png',
                          width: 50,
                          height: 50,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 100.0),
                    child: Text(
                      "Nişangahlar",
                      style:
                          TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 24, 0, 0),
                child: TextField(
                  // controller: model.numberTextController,
                  // maxLength: 12,
                  decoration: InputDecoration(
                      hintText: 'Axtar...',
                      border: const OutlineInputBorder(
                          //Outline border type for TextFeild
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(
                            color: Color.fromARGB(46, 158, 158, 158),
                            // width: 0.5,
                          )),
                      // isDense: true,
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SvgPicture.asset(
                            'assets/images/MagnifyingGlass.svg'),
                      )
                      // prefixIconConstraints:
                      //     BoxConstraints(minWidth: 0, minHeight: 0),
                      ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                // width: 150,
                // width: MediaQuery.of(context).size.width / 3,
                child: ToggleButtons(
                    splashColor: Colors.transparent,
                    fillColor: const Color.fromRGBO(34, 186, 104, 1),
                    selectedColor: Colors.white,
                    constraints: BoxConstraints.expand(
                        width: MediaQuery.of(context).size.width / 3.3),
                    onPressed: (index) {
                      setState(() {
                        for (int buttonIndex = 0;
                            buttonIndex < _isSelected.length;
                            buttonIndex++) {
                          if (buttonIndex == index) {
                            _isSelected[buttonIndex] =
                                !_isSelected[buttonIndex];
                            // color = textColor;

                          } else {
                            _isSelected[buttonIndex] = false;
                          }
                        }
                      });
                    },
                    borderRadius: BorderRadius.circular(8),
                    children: [Text('Rayon'), Text('Metro'), Text('Nişangah')],
                    isSelected: _isSelected),
              ),
              if (_isSelected[0])
                ListTileForSettlements()
              else if (_isSelected[1])
                ListTileForMetros()
              else if (_isSelected[2])
                ListTileForNisangah(),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize:
                        Size(MediaQuery.of(context).size.width - 24, 40),
                    backgroundColor: const Color.fromRGBO(34, 186, 104, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onPressed: () {
                    watch.getSatilirMertebeCount();
                    Navigator.pop(context);
                  },
                  child: const Text('Deyisilikleri Testiq et')),
            ],
          ),
        ),
      ),
    );
  }
}
