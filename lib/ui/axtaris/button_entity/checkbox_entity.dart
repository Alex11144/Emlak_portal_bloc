// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:database_trial/bloc/bloc/search_reqest_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckboxEntityWidget extends StatefulWidget {
  bool isSelected = false;
  final void Function()? onTap;

  String text;
  CheckboxEntityWidget({
    Key? key,
    // required this.isSelected,
    this.onTap,
    required this.text,
  }) : super(key: key);

  @override
  State<CheckboxEntityWidget> createState() => _CheckboxEntityWidgetState();
}

class _CheckboxEntityWidgetState extends State<CheckboxEntityWidget> {
  @override
  Widget build(BuildContext context) {
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
                  widget.isSelected = value!;
                });
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
