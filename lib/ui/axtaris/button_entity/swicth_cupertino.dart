// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:database_trial/ui/axtaris/button_entity/room_count_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/evler_data/evler_data.dart';

class SwitchEntityWidget extends StatefulWidget {
  bool isSelected = false;
  final void Function()? onTap;

  String text;
  SwitchEntityWidget({
    Key? key,
    // required this.isSelected,
    this.onTap,
    required this.text,
  }) : super(key: key);

  @override
  State<SwitchEntityWidget> createState() => _SwitchEntityWidgetState();
}

class _SwitchEntityWidgetState extends State<SwitchEntityWidget> {
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
                  if (queryParameters.announcer == '0') {
                    queryParameters.announcer = '1';
                  } else {
                    queryParameters.announcer = '0';
                  }
                  widget.isSelected = value;
                });
                watch.getSatilirMertebeCount();
              },
            ),
          ],
        ),
      ),
    );
  }
}
