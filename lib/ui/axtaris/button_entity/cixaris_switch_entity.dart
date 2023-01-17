// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:database_trial/ui/axtaris/button_entity/room_count_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../bloc/bloc/search_reqest_bloc.dart';
import '../../../data/evler_data/evler_data.dart';

class CixarisSwitchEntityWidget extends StatefulWidget {
  bool isSelected = false;
  final void Function()? onTap;

  String text;
  CixarisSwitchEntityWidget({
    Key? key,
    // required this.isSelected,
    this.onTap,
    required this.text,
  }) : super(key: key);

  @override
  State<CixarisSwitchEntityWidget> createState() =>
      _CixarisSwitchEntityWidgetState();
}

class _CixarisSwitchEntityWidgetState extends State<CixarisSwitchEntityWidget> {
  @override
  Widget build(BuildContext context) {
    final watch = context.watch<SatilanEvlerData>();

    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: 0.5, color: Colors.grey),
          borderRadius: BorderRadius.circular(8)),
      width: MediaQuery.of(context).size.width,
      height: 40,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.text,
              style: TextStyle(
                  color: widget.isSelected ? Colors.blue : Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
            CupertinoSwitch(
              activeColor: Colors.blue,
              value: widget.isSelected,
              onChanged: (value) {
                setState(() {
                  if (queryParameters.document == '0') {
                    queryParameters.document = '1';
                  } else {
                    queryParameters.document = '0';
                  }
                  widget.isSelected = value;
                });
                watch.getSatilirMertebeCount();
                BlocProvider.of<SearchRequestBloc>(context, listen: false)
                    .add(OntapEvent());
              },
            ),
          ],
        ),
      ),
    );
  }
}
