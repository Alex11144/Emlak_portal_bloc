import 'package:database_trial/ui/axtaris/button_entity/checkbox_entity.dart';
import 'package:database_trial/ui/axtaris/button_entity/chip_choices.dart';
import 'package:database_trial/ui/axtaris/button_entity/cixaris_switch_entity.dart';
import 'package:database_trial/ui/axtaris/button_entity/current_floor_entity.dart';
import 'package:database_trial/ui/axtaris/button_entity/floor_count.dart';
import 'package:database_trial/ui/axtaris/button_entity/kredit_switch_entity.dart';
import 'package:database_trial/ui/axtaris/button_entity/propertyTypeEntities/ev_villa_button_entity.dart';
import 'package:database_trial/ui/axtaris/button_entity/propertyTypeEntities/kohne_tikili_button_entity.dart';
import 'package:database_trial/ui/axtaris/button_entity/propertyTypeEntities/menzil_button_entity.dart';
import 'package:database_trial/ui/axtaris/button_entity/propertyTypeEntities/yeni_tikili_button_entity.dart';
import 'package:database_trial/ui/axtaris/button_entity/range_slider_entity.dart';
import 'package:database_trial/ui/axtaris/button_entity/room_count_entity.dart';
import 'package:database_trial/ui/axtaris/button_entity/sahe_range_slider.dart';
import 'package:database_trial/ui/axtaris/button_entity/sertler_checkbox.dart/1-ci_olmasin.dart';
import 'package:database_trial/ui/axtaris/button_entity/sertler_checkbox.dart/yalniz_ust.dart';
import 'package:database_trial/ui/axtaris/button_entity/swicth_cupertino.dart';
import 'package:database_trial/ui/axtaris/list_tile/list_tile_seherler.dart';
import 'package:database_trial/ui/axtaris/list_tile/seher_baki_or_not.dart';
import 'package:database_trial/ui/axtaris/list_tile/textForSeherName.dart';
import 'package:database_trial/ui/axtaris/nisangahlar/toggle_buttons_lists.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../data/evler_data/evler_data.dart';
import 'button_entity/sertler_checkbox.dart/en_ust_olmasin.dart';

double minPrice = 5000;
double maxPrice = 1000000;
RangeValues values = const RangeValues(1, 750);
RangeValues valuesQiymet = RangeValues(minPrice, maxPrice);

class AxtarisListWidget extends StatefulWidget {
  const AxtarisListWidget({super.key});

  @override
  State<AxtarisListWidget> createState() => _AxtarisListWidgetState();
}

class _AxtarisListWidgetState extends State<AxtarisListWidget> {
  // RangeLabels labels = RangeLabels('1' "750", '1' '750');
  // double minPrice = double.parse(queryParameters.minPrice);
  // double maxPrice = double.parse(queryParameters.minPrice);

  // bool _switchValue = true;

  @override
  Widget build(BuildContext context) {
    // final watch = context.read<SatilanEvlerData>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: Row(
            children: [
              Text('Şəhər :'),
              InkWell(
                onTap: () {
                  // watch.seherler2 = watch.seherler;
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ListTileForSeher()));
                },
                child: TextWidget(),
              ),
              SvgPicture.asset('assets/images/CaretRight.svg'),
            ],
          ),
        ),
        // SizedBox(
        //   height: 15,
        // ),
        BakiOrNotWidget(),
        // queryParameters.cityId == '1'
        //     ? const Divider(
        //         height: 20,
        //         thickness: 0.7,
        //       )
        //     :
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 12, 0, 24),
          child: SizedBox(
            width: MediaQuery.of(context).size.width - 20,
            height: 49,
            child: ListView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: [
                  Row(
                    children: [
                      ChipChoices(),
                      //   const SizedBox(
                      //     width: 12,
                      //   ),
                      //   YeniTikiliButtonEntityWidget(
                      //       // currentFloorValue: '1',

                      //       // isSelected: false,
                      //       height: 40,
                      //       width: 98,
                      //       borderRadius: 16,
                      //       text: 'Yeni tikili'),
                      //   const SizedBox(
                      //     width: 12,
                      //   ),
                      //   KohneButtonEntityWidget(
                      //       // currentFloorValue: '1',

                      //       // isSelected: false,
                      //       height: 40,
                      //       width: 110,
                      //       borderRadius: 16,
                      //       text: 'Köhnə tikili'),
                      //   const SizedBox(
                      //     width: 12,
                      //   ),
                      //   EvVillaButtonEntityWidget(
                      //       // currentFloorValue: '1',

                      //       // isSelected: false,
                      //       height: 40,
                      //       width: 95,
                      //       borderRadius: 16,
                      //       text: 'Ev / Villa'),
                    ],
                  ),
                ]),
          ),
        ),
        const Divider(
          height: 10,
          thickness: 0.7,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 12, 0, 24),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                RoomCountEntityWidget(
                    roomCount: '1',
                    // currentFloorValue: '0',
                    // floorCount: '11111',
                    // isSelected: false,
                    height: 40,
                    width: 40,
                    borderRadius: 64,
                    text: '1'),
                const SizedBox(
                  width: 12,
                ),
                RoomCountEntityWidget(
                    roomCount: '2',

                    // isSelected: false,
                    height: 40,
                    width: 40,
                    borderRadius: 64,
                    text: '2'),
                const SizedBox(
                  width: 12,
                ),
                RoomCountEntityWidget(
                    roomCount: '3',

                    // isSelected: false,
                    height: 40,
                    width: 40,
                    borderRadius: 64,
                    text: '3'),
                const SizedBox(
                  width: 12,
                ),
                RoomCountEntityWidget(
                    roomCount: '4',

                    // isSelected: false,
                    height: 40,
                    width: 40,
                    borderRadius: 64,
                    text: '4'),
                const SizedBox(
                  width: 12,
                ),
                RoomCountEntityWidget(
                    roomCount: '5',

                    // isSelected: false,
                    height: 40,
                    width: 143,
                    borderRadius: 16,
                    text: '5+ otaqlı')
              ],
            ),
          ),
        ),
        const Divider(
          thickness: 0.7,
          height: 15,
        ),
        const Padding(
          padding: EdgeInsets.only(top: 8.0, bottom: 35),
          child: Text(
            'Sahə, m²',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ),
        RangeSliderForSahe(
          division: 750,
          max: double.parse(queryParameters.maxSpace!).roundToDouble(),
          min: double.parse(queryParameters.minSpace!).roundToDouble(),
          values: RangeValues(
              double.parse(queryParameters.minSpace!).roundToDouble(),
              double.parse(queryParameters.maxSpace!).roundToDouble()),
        ),
        const Divider(
          height: 30,
          thickness: 0.7,
        ),
        const Padding(
          padding: EdgeInsets.only(top: 8.0, bottom: 35),
          child: Text(
            'Qiymət, AZN',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ),
        RangeSliderForPrice(
          division: 2000000,
          max: double.parse(queryParameters.maxPrice!).roundToDouble(),
          min: double.parse(queryParameters.minPrice!).roundToDouble(),
          values: RangeValues(
              double.parse(queryParameters.minPrice!).roundToDouble(),
              double.parse(queryParameters.maxPrice!).roundToDouble()),
        ),
        const Divider(
          height: 15,
          thickness: 0.7,
        ),
        CixarisSwitchEntityWidget(
          text: 'Cixaris var',
          // isSelected: false,
        ),
        const SizedBox(
          height: 8,
        ),
        SwitchEntityWidget(
          text: 'Abunelere elave et',
          // isSelected: false,
        ),
        const SizedBox(
          height: 8,
        ),
        KreditSwitchEntityWidget(
          text: 'Ipoteka var',
          // isSelected: false,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Row(
            children: [
              RoomCountEntityWidget(
                  // currentFloorValue: '1',

                  // isSelected: false,
                  height: 50,
                  width: 167,
                  borderRadius: 8,
                  text: 'İlkin ödəniş'),
              const SizedBox(
                width: 8,
              ),
              RoomCountEntityWidget(
                  // currentFloorValue: '1',

                  // isSelected: false,
                  height: 50,
                  width: 167,
                  borderRadius: 8,
                  text: 'Aylıq ödəniş'),
            ],
          ),
        ),
        const Divider(
          height: 20,
          thickness: 0.7,
        ),
        const Text(
          'Mərtəbə',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 8,
        ),
        SizedBox(
          height: 80,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 12, 0, 24),
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              children: [
                CurrentFloorEntityWidget(
                    currentFloorValue: '1',

                    // isSelected: false,
                    height: 40,
                    width: 40,
                    borderRadius: 64,
                    text: '1'),
                const SizedBox(
                  width: 12,
                ),
                CurrentFloorEntityWidget(
                    currentFloorValue: '2',

                    // isSelected: false,
                    height: 40,
                    width: 40,
                    borderRadius: 64,
                    text: '2'),
                const SizedBox(
                  width: 12,
                ),
                CurrentFloorEntityWidget(
                    currentFloorValue: '3',

                    // isSelected: false,
                    height: 40,
                    width: 40,
                    borderRadius: 64,
                    text: '3'),
                const SizedBox(
                  width: 12,
                ),
                CurrentFloorEntityWidget(
                    currentFloorValue: '4',

                    // isSelected: false,
                    height: 40,
                    width: 40,
                    borderRadius: 64,
                    text: '4'),
                const SizedBox(
                  width: 12,
                ),
                CurrentFloorEntityWidget(
                    currentFloorValue: '5',

                    // isSelected: false,
                    height: 40,
                    width: 40,
                    borderRadius: 64,
                    text: '5'),
                const SizedBox(
                  width: 12,
                ),
                CurrentFloorEntityWidget(
                    currentFloorValue: '6',

                    // isSelected: false,
                    height: 40,
                    width: 40,
                    borderRadius: 64,
                    text: '6'),
                const SizedBox(
                  width: 12,
                ),
                CurrentFloorEntityWidget(
                    currentFloorValue: '7',

                    // isSelected: false,
                    height: 40,
                    width: 40,
                    borderRadius: 64,
                    text: '7'),
                const SizedBox(
                  width: 12,
                ),
                CurrentFloorEntityWidget(
                    currentFloorValue: '8',

                    // isSelected: false,
                    height: 40,
                    width: 40,
                    borderRadius: 64,
                    text: '8'),
              ],
            ),
          ),
        ),
        EnUstOlmasin(
          text: 'Ən üst olmasın',
          // isSelected: false,
        ),
        const SizedBox(
          height: 8,
        ),
        YalnizUst(
          text: 'Yalnız ən üst',
          // isSelected: false,
        ),
        const SizedBox(
          height: 8,
        ),
        NoFirstFloor(
          text: '1-ci olmasın',
          // isSelected: false,
        ),
        const Divider(
          height: 30,
          thickness: 0.7,
        ),
        const Text(
          'Mərtəbə sayı',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 8,
        ),
        SizedBox(
          height: 80,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 12, 0, 24),
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              children: [
                FloorCountEntityWidget(
                    floorCount: '1',

                    // isSelected: false,
                    height: 40,
                    width: 40,
                    borderRadius: 64,
                    text: '1'),
                const SizedBox(
                  width: 12,
                ),
                FloorCountEntityWidget(
                    floorCount: '2',

                    // isSelected: false,
                    height: 40,
                    width: 40,
                    borderRadius: 64,
                    text: '2'),
                const SizedBox(
                  width: 12,
                ),
                FloorCountEntityWidget(
                    floorCount: '3',

                    // isSelected: false,
                    height: 40,
                    width: 40,
                    borderRadius: 64,
                    text: '3'),
                const SizedBox(
                  width: 12,
                ),
                FloorCountEntityWidget(
                    floorCount: '4',

                    // isSelected: false,
                    height: 40,
                    width: 40,
                    borderRadius: 64,
                    text: '4'),
                const SizedBox(
                  width: 12,
                ),
                FloorCountEntityWidget(
                    floorCount: '5',

                    // isSelected: false,
                    height: 40,
                    width: 40,
                    borderRadius: 64,
                    text: '5'),
                const SizedBox(
                  width: 12,
                ),
                FloorCountEntityWidget(
                    floorCount: '6',

                    // isSelected: false,
                    height: 40,
                    width: 40,
                    borderRadius: 64,
                    text: '6'),
                const SizedBox(
                  width: 12,
                ),
                FloorCountEntityWidget(
                    floorCount: '7',

                    // isSelected: false,
                    height: 40,
                    width: 40,
                    borderRadius: 64,
                    text: '7'),
                const SizedBox(
                  width: 12,
                ),
                FloorCountEntityWidget(
                    floorCount: '8',

                    // isSelected: false,
                    height: 40,
                    width: 40,
                    borderRadius: 64,
                    text: '8'),
              ],
            ),
          ),
        ),
        const Divider(
          height: 15,
          thickness: 0.7,
        ),
        const SizedBox(
          height: 10,
        ),
        SwitchEntityWidget(
          text: 'Emlak sahibinden',
          // isSelected: false,
        ),
        const SizedBox(
          height: 30,
        )
      ],
    );
  }
}
