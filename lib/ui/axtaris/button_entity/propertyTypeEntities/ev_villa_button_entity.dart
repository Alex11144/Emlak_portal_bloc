import 'package:database_trial/domain/api_clients/filter_api/filter_api_client.dart';
import 'package:database_trial/ui/axtaris/button_entity/room_count_entity.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../data/evler_data/evler_data.dart';
import '../../../evler/elanlarList/elanlar_list.dart';

class EvVillaButtonEntityWidget extends StatefulWidget {
  // bool isSelected = false;
  final void Function()? onTap;
  double height;
  double width;
  double borderRadius;
  String text;
  String? floorCount;
  EvVillaButtonEntityWidget({
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
  State<EvVillaButtonEntityWidget> createState() =>
      _EvVillaButtonEntityWidgetState();
}

class _EvVillaButtonEntityWidgetState extends State<EvVillaButtonEntityWidget> {
  final filterApi = FilterApiClient();
  @override
  Widget build(BuildContext context) {
    final watch = context.watch<SatilanEvlerData>();

    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          border: watch.evVilla
              ? Border.all(width: 0)
              : Border.all(width: 0.2, color: Colors.grey),
        ),
        width: widget.width,
        height: widget.height,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              foregroundColor: watch.evVilla ? Colors.white : Colors.black,
              backgroundColor: watch.evVilla
                  ? const Color.fromRGBO(34, 186, 104, 1)
                  : Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius),
              ),
            ),
            onPressed: () {
              if (queryParameters.propertyType == '0' ||
                  queryParameters.propertyType == '1' ||
                  queryParameters.propertyType == '2') {
                queryParameters.propertyType = '3';
              } else {
                queryParameters.propertyType = '0';
              }

              setState(() {
                watch.menzil = false;
                watch.yeni = false;
                watch.kohne = false;
                watch.evVilla = !watch.evVilla;
              });
              watch.getSatilirMertebeCount();

              // tapped1 = false;
            },
            child: Text(
              widget.text,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
            )));
  }
}
