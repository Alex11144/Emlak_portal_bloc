import 'package:database_trial/data/evler_data/evler_data.dart';
import 'package:database_trial/ui/axtaris/button_entity/room_count_entity.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class YalnizUst extends StatefulWidget {
  bool isSelected = false;
  final void Function()? onTap;

  String text;
  YalnizUst({
    Key? key,
    // required this.isSelected,
    this.onTap,
    required this.text,
  }) : super(key: key);

  @override
  State<YalnizUst> createState() => _YalnizUstState();
}

class _YalnizUstState extends State<YalnizUst> {
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
            Checkbox(
              shape: const CircleBorder(),
              activeColor: Colors.blue,
              value: widget.isSelected,
              onChanged: (value) {
                setState(() {
                  if (queryParameters.isTopFloor == 'false') {
                    queryParameters.isTopFloor = 'true';
                  } else {
                    queryParameters.isTopFloor = 'false';
                  }
                  widget.isSelected = value!;
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
