import 'package:database_trial/data/evler_data/evler_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final watch = context.watch<SatilanEvlerData>();

    return Text(
      watch.seherName,
      style: TextStyle(
          fontSize: 16,
          color: Colors.blue,
          decoration: TextDecoration.underline),
    );
  }
}
