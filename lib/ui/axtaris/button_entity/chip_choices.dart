import 'package:chips_choice/chips_choice.dart';
import 'package:database_trial/bloc/bloc/search_reqest_bloc.dart';
import 'package:database_trial/ui/axtaris/button_entity/room_count_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../data/evler_data/evler_data.dart';

class ChipChoices extends StatefulWidget {
  const ChipChoices({super.key});

  @override
  State<ChipChoices> createState() => _ChipChoicesState();
}

class _ChipChoicesState extends State<ChipChoices> {
  // List<Map<String, String>> days = [
  //   {'value': queryParameters.propertyType = '0', 'title': 'Menzil'},
  //   {'value': queryParameters.propertyType = '1', 'title': 'Yeni tikili'},
  //   {'value': queryParameters.propertyType = '2', 'title': 'Kohne tikili'},
  //   {'value': queryParameters.propertyType = '3', 'title': 'Ev/villa'},
  // ];

  List getChoices = ['Menzil', 'Yeni tikili', 'Kohne tikili', 'Ev/villa'];
  String _value = '0';

  @override
  Widget build(BuildContext context) {
    final watch = context.watch<SatilanEvlerData>();

    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 12.0,
      children: List<Widget>.generate(
        4,
        (int index) {
          return Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: ChoiceChip(
              // padding: EdgeInsets.only(right: 10),
              elevation: 0,
              pressElevation: 0.0,
              selectedColor: const Color.fromRGBO(34, 186, 104, 1),
              backgroundColor: Colors.white,
              label: Text(
                getChoices[index].toString(),
                style: TextStyle(fontSize: 13),
              ),
              labelStyle: TextStyle(
                  color:
                      _value == index.toString() ? Colors.white : Colors.black),
              selected: _value == index.toString(),
              onSelected: (bool selected) {
                setState(() {
                  _value = (selected ? index.toString() : '0');
                  queryParameters.propertyType = _value;
                });
                watch.getSatilirMertebeCount();
                BlocProvider.of<SearchRequestBloc>(context, listen: false)
                    .add(OntapEvent());
              },
            ),
          );
        },
      ).toList(),
    );
  }
}
