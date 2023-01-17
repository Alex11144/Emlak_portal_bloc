import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:database_trial/data/evler_data/evler_data.dart';

class NeticelerWidget extends StatelessWidget {
  const NeticelerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final evler = context.watch<SatilanEvlerData>().count;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Text(
              'Son Elanlar ',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            Text(
              '( ${'$evler elan'} )',
              style: const TextStyle(color: Color.fromRGBO(51, 51, 51, 0.6)),
            )
          ],
        ),
        SizedBox(
          // height: 87,
          width: 95,
          child: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/images/sifirlaFilter.svg',
                // height: 80,
                // width: 80,
              )),
        ),
        CircleAvatar(
            radius: 18,
            backgroundColor: const Color.fromRGBO(235, 0, 0, 0.1),
            child: IconButton(
                onPressed: () {},
                icon: Image.asset('assets/images/SlidersHorizontal.png'))),
      ],
    );
  }
}
