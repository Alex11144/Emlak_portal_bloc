// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:database_trial/ui/axtaris/button_entity/room_count_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../../../data/evler_data/evler_data.dart';

class ListTileForNisangah extends StatefulWidget {
  ListTileForNisangah({
    Key? key,
  }) : super(key: key);

  @override
  State<ListTileForNisangah> createState() => _ListTileForNisangahState();
}

class _ListTileForNisangahState extends State<ListTileForNisangah> {
  // late List<bool> isChecked;

  @override
  Widget build(BuildContext context) {
    final watch = context.watch<SatilanEvlerData>();
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemCount: watch.nisangah.length,
        itemBuilder: (BuildContext context, int index) {
          final list = List.filled(watch.nisangah.length, false);

          return Padding(
            padding: const EdgeInsets.only(bottom: 0.0, top: 8),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 0.2),
                  borderRadius: BorderRadius.circular(8)),
              child: ListTile(
                  textColor: queryParameters.markId
                          .contains(watch.nisangah[index].id.toString())
                      ? Colors.blue
                      : Colors.black,
                  selectedColor: Colors.blue,
                  title: Text(watch.nisangah[index].name),
                  trailing: Checkbox(
                    shape: CircleBorder(),
                    value: queryParameters.markId
                            .contains(watch.nisangah[index].id.toString())
                        ? list[index] = true
                        : list[index] = false,
                    onChanged: ((value) {
                      setState(() {
                        queryParameters.markId
                                .contains(watch.nisangah[index].id.toString())
                            ? queryParameters.markId
                                .remove(watch.nisangah[index].id.toString())
                            : queryParameters.markId
                                .add(watch.nisangah[index].id.toString());
                      });
                    }),
                  )),
            ),
          );
        },
      ),
    );
  }
}
