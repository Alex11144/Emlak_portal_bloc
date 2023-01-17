import 'package:database_trial/bloc/bloc/search_reqest_bloc.dart';
import 'package:database_trial/domain/api_clients/filter_api/filter_api_client.dart';
import 'package:database_trial/ui/axtaris/button_entity/room_count_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../data/evler_data/evler_data.dart';

class FloorCountEntityWidget extends StatefulWidget {
  bool isSelected = false;
  final void Function()? onTap;
  double height;
  double width;
  double borderRadius;
  String text;
  String? floorCount;
  FloorCountEntityWidget({
    Key? key,
    // required this.isSelected,
    this.onTap,
    required this.height,
    required this.width,
    required this.borderRadius,
    required this.text,
    this.floorCount,
  }) : super(key: key);

  @override
  State<FloorCountEntityWidget> createState() => _FloorCountEntityWidgetState();
}

class _FloorCountEntityWidgetState extends State<FloorCountEntityWidget> {
  final filterApi = FilterApiClient();
  @override
  Widget build(BuildContext context) {
    final watch = context.watch<SatilanEvlerData>();

    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          border: widget.isSelected
              ? Border.all(width: 0)
              : Border.all(width: 0.2, color: Colors.grey),
        ),
        width: widget.width,
        height: widget.height,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              foregroundColor: widget.isSelected ? Colors.white : Colors.black,
              backgroundColor: widget.isSelected
                  ? const Color.fromRGBO(34, 186, 104, 1)
                  : Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius),
              ),
            ),
            onPressed: () {
              if (queryParameters.floorCount.contains(widget.floorCount)) {
                queryParameters.floorCount.remove(widget.floorCount);
              } else {
                queryParameters.floorCount.add(widget.floorCount);
              }

              watch.getSatilirMertebeCount();
              widget.isSelected = !widget.isSelected;
              BlocProvider.of<SearchRequestBloc>(context, listen: false)
                  .add(OntapEvent());
              setState(() {});

              // tapped1 = false;
            },
            child: Text(
              widget.text,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
            )));
  }
}
