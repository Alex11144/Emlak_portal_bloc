// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:database_trial/ui/axtaris/button_entity/room_count_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../../../data/evler_data/evler_data.dart';

class ListTileForSettlements extends StatefulWidget {
  ListTileForSettlements({
    Key? key,
  }) : super(key: key);

  @override
  State<ListTileForSettlements> createState() => _ListTileForSettlementsState();
}

class _ListTileForSettlementsState extends State<ListTileForSettlements> {
  // late List<bool> isChecked;

  @override
  Widget build(BuildContext context) {
    final watch = context.watch<SatilanEvlerData>();
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemCount: watch.regions.length,
        itemBuilder: (BuildContext context, int index) {
          final list = List.filled(watch.regions.length, false);

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 0.0, top: 8),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 0.2),
                      borderRadius: BorderRadius.circular(8)),
                  child: Material(
                    color: Colors.transparent,
                    child: ListTile(
                        tileColor: const Color.fromRGBO(0, 80, 235, 0.1),
                        textColor: queryParameters.regionId.contains(
                                watch.regions[index].regionId.toString())
                            ? Colors.blue
                            : Colors.black,
                        selectedColor: Colors.blue,
                        title: Text(watch.regions[index].regionName),
                        trailing: Checkbox(
                          shape: CircleBorder(),
                          value: queryParameters.regionId.contains(
                                  watch.regions[index].regionId.toString())
                              ? list[index] = true
                              : list[index] = false,
                          onChanged: ((value) {
                            setState(() {
                              queryParameters.regionId.contains(
                                      watch.regions[index].regionId.toString())
                                  ? queryParameters.regionId.remove(
                                      watch.regions[index].regionId.toString())
                                  : queryParameters.regionId.add(
                                      watch.regions[index].regionId.toString());
                            });
                          }),
                        )),
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: watch.settlemetDto[index].length,
                itemBuilder: (BuildContext context, int index1) {
                  final list =
                      List.filled(watch.settlemetDto[index].length, false);

                  final settlementNames =
                      watch.settlemetDto.map((e) => e).toList()[index];
                  watch.settlementDtoId =
                      watch.settlemetDto.map((e) => e).toList()[index];

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 0.0, top: 8),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: 0.2),
                          borderRadius: BorderRadius.circular(8)),
                      child: ListTile(
                          textColor: queryParameters.settlementId.contains(watch
                                  .settlementDtoId[index1]['settlementId']
                                  .toString())
                              ? Colors.blue
                              : Colors.black,
                          selectedColor: Colors.blue,
                          title:
                              Text(settlementNames[index1]['settlementName']),
                          trailing: Checkbox(
                            shape: CircleBorder(),
                            value: queryParameters.settlementId.contains(watch
                                    .settlementDtoId[index1]['settlementId']
                                    .toString())
                                ? list[index] = true
                                : list[index] = false,
                            onChanged: ((value) {
                              setState(() {
                                queryParameters.settlementId.contains(watch
                                        .settlementDtoId[index1]['settlementId']
                                        .toString())
                                    ? queryParameters.settlementId.remove(watch
                                        .settlementDtoId[index1]['settlementId']
                                        .toString())
                                    : queryParameters.settlementId.add(watch
                                        .settlementDtoId[index1]['settlementId']
                                        .toString());
                              });
                            }),
                          )),
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
