// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:database_trial/ui/axtaris/button_entity/room_count_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../data/evler_data/evler_data.dart';

class ListTileForSeher extends StatefulWidget {
  ListTileForSeher({
    Key? key,
  }) : super(key: key);

  @override
  State<ListTileForSeher> createState() => _ListTileForSeherState();
}

class _ListTileForSeherState extends State<ListTileForSeher> {
  // late List<bool> isChecked;
  String? _currentTimeValue = '0';
  int index1 = 0;
  final controller = TextEditingController();
  @override
  void initState() {
    final auth = Provider.of<SatilanEvlerData>(context, listen: false);

    super.initState();
    auth.seherler2 = auth.seherler;
  }

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
                          setState(() {});
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
                      "Şəhər",
                      style:
                          TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 24, 0, 0),
                child: TextField(
                  controller: controller,
                  onChanged: (String query) {
                    final auth =
                        Provider.of<SatilanEvlerData>(context, listen: false);
                    final suggestions = auth.seherler.where((product) {
                      final productTitle = product.name.toLowerCase();
                      final input = query.toLowerCase();

                      return productTitle.contains(input);
                    }).toList();
                    setState(() {
                      auth.seherler2 = suggestions;
                    });
                  },
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
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: watch.seherler2.length,
                  itemBuilder: (BuildContext context, int index) {
                    final list = List.filled(watch.seherler.length, false);
                    final seher = watch.seherler2[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 0.0, top: 8),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: 0.2),
                            borderRadius: BorderRadius.circular(8)),
                        child: ListTile(
                            textColor: queryParameters.markId
                                    .contains(seher.id.toString())
                                ? Colors.blue
                                : Colors.black,
                            selectedColor: Colors.blue,
                            title: Text(seher.name),
                            trailing: Radio(
                              groupValue: queryParameters.cityId,
                              // shape: CircleBorder(),
                              value: seher.id.toString(),
                              onChanged: ((value) {
                                setState(() {
                                  queryParameters.cityId = value!.toString();
                                  watch.cityId =
                                      queryParameters.cityId.toString();
                                  index1 = index;
                                });
                              }),
                            )),
                      ),
                    );
                  },
                ),
              ),
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
                    if (queryParameters.cityId != '1') {
                      queryParameters.metroId.clear();
                      queryParameters.regionId.clear();
                      queryParameters.markId.clear();
                      queryParameters.settlementId.clear();
                    } else {
                      watch.getMetros();
                      watch.getNisangah();
                      watch.getSehrler();
                      watch.getSettlementDto();
                      watch.getSettlements();
                    }
                    watch.seherName = watch.seherler2[index1].name;
                    watch.cityId = queryParameters.cityId.toString();
                    watch.getSatilirMertebeCount();
                    // queryParameters.cityId = _currentTimeValue;
                    setState(() {});
                    Navigator.pop(context);
                  },
                  child: const Text('Deyisilikleri Testiq et')),
            ],
          ),
        ),
      ),
    );
  }
  //   void searchProduct(String query) {
  //   final suggestions = product1.where((product) {
  //     final productTitle = product.text.toLowerCase();
  //     final input = query.toLowerCase();

  //     return productTitle.contains(input);
  //   }).toList();
  //   setState(() {
  //     product = suggestions;
  //   });
  // }
}
