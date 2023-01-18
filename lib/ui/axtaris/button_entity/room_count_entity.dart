// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:database_trial/bloc/bloc/search_reqest_bloc.dart';
import 'package:database_trial/domain/api_clients/filter_api/filter_api_client.dart';
import 'package:database_trial/ui/axtaris/axtaris_birlesme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../data/evler_data/evler_data.dart';
import '../../../domain/entitites/filter/filters.dart';

QueryParameters queryParameters = QueryParameters();

class RoomCountEntityWidget extends StatefulWidget {
  bool isSelected = false;
  final void Function()? onTap;
  double height;
  double width;
  double borderRadius;
  String text;
  String? roomCount;
  RoomCountEntityWidget(
      {Key? key,
      // required this.isSelected,
      this.onTap,
      required this.height,
      required this.width,
      required this.borderRadius,
      required this.text,
      this.roomCount})
      : super(key: key);

  @override
  State<RoomCountEntityWidget> createState() => _RoomCountEntityWidgetState();
}

class _RoomCountEntityWidgetState extends State<RoomCountEntityWidget> {
  final filterApi = FilterApiClient();
  @override
  Widget build(BuildContext context) {
    final watch = context.watch<SatilanEvlerData>();
    // final requestBloc = ;
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
              // isloading = false;
              widget.isSelected = !widget.isSelected;
              setState(() {});

              // isloading = false;

              // requestBloc.add(OntapEvent());
              // if (queryParameters.currentFloor
              //     .contains(widget.currentFloorValue)) {
              //   queryParameters.currentFloor.remove(widget.currentFloorValue);
              // } else {
              //   queryParameters.currentFloor.add(widget.currentFloorValue);
              // }

              if (queryParameters.roomCount.contains(widget.roomCount)) {
                queryParameters.roomCount.remove(widget.roomCount);
              } else {
                queryParameters.roomCount.add(widget.roomCount);
              }

              // if (queryParameters.floorCount.contains(widget.floorCount)) {
              //   queryParameters.floorCount.remove(widget.floorCount);
              // } else {
              //   queryParameters.floorCount.add(widget.floorCount);
              // }
              // watch.getSatilirMertebeCount();
              watch.getSatilirMertebeCount();
              //     .whenComplete(() => isloading = true);
              BlocProvider.of<SearchRequestBloc>(context, listen: false)
                  .add(OntapEvent());

              // tapped1 = false;
            },
            child: Text(
              widget.text,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
            )));
  }
}
