// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:database_trial/bloc/bloc/search_reqest_bloc.dart';
import 'package:database_trial/domain/api_clients/filter_api/filter_api_client.dart';
import 'package:database_trial/ui/axtaris/button_entity/room_count_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../data/evler_data/evler_data.dart';

class RangeSliderForSahe extends StatefulWidget {
  final void Function()? onTap;
  RangeLabels labels = const RangeLabels('1' "750", '1' '750');
  RangeValues values;
  double min;
  double max;
  int? division;
  // RangeValues valuesQiymet = RangeValues(5000, 1000000);
  RangeSliderForSahe({
    Key? key,
    this.onTap,
    required this.values,
    required this.min,
    required this.max,
    required this.division,
  }) : super(key: key);

  @override
  State<RangeSliderForSahe> createState() => _RangeSliderForSaheState();
}

class _RangeSliderForSaheState extends State<RangeSliderForSahe> {
  final axtarisApi = FilterApiClient();
  @override
  Widget build(BuildContext context) {
    final watch = context.watch<SatilanEvlerData>();
    return RangeSlider(
        inactiveColor: const Color.fromRGBO(51, 51, 51, 0.1),
        // thumbColor: Color.fromRGBO(255, 175, 60, 1),
        activeColor: const Color.fromRGBO(255, 175, 60, 1),
        divisions: widget.division,
        min: widget.min,
        max: widget.max,
        values: widget.values,
        labels: RangeLabels(
          widget.values.start.round().toString(),
          widget.values.end.round().toString(),
        ),
        onChanged: (value) {
          setState(() {
            widget.values = value;
            widget.labels = RangeLabels("${value.start.toInt().toString()}\$",
                "${value.start.toInt().toString()}\$");
          });
        },
        onChangeEnd: (value) {
          setState(() {
            queryParameters.minSpace = value.start.toInt().toString();
            queryParameters.maxSpace = value.end.toInt().toString();
            BlocProvider.of<SearchRequestBloc>(context, listen: false)
                .add(OntapEvent());
          });
          watch.getSatilirMertebeCount();
        });
  }
}
