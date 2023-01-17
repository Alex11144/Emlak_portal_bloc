import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppBarSonElanlar extends StatelessWidget {
  const AppBarSonElanlar({super.key});

  @override
  Widget build(BuildContext context) {
    // final evler = context.read<Evler>();

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 21,
              backgroundColor: const Color.fromRGBO(235, 155, 0, 0.1),
              child: IconButton(
                  padding: const EdgeInsets.all(0),
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    'assets/images/bell_svg.svg',
                    width: 50,
                    height: 50,
                  )),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 120.0),
              child: Text(
                "Elanlar",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        )
      ],
    );
  }
}
