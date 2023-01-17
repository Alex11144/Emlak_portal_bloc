import 'package:database_trial/ui/navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SonElanlar extends StatelessWidget {
  const SonElanlar({super.key});

  @override
  Widget build(BuildContext context) {
    // final evler = context.read<Evler>();

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              radius: 21,
              backgroundColor: const Color.fromRGBO(235, 155, 0, 0.1),
              child: IconButton(
                  padding: const EdgeInsets.all(0),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Image.asset(
                    'assets/images/arrow_back.png',
                    width: 50,
                    height: 50,
                  )),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 0.0),
              child: Text(
                "Nəticə",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
              ),
            ),
            CircleAvatar(
              radius: 21,
              backgroundColor: Colors.white,
              child: IconButton(
                  padding: const EdgeInsets.all(0),
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    'assets/images/addIcon.svg',
                    width: 50,
                    height: 50,
                  )),
            )
          ],
        )
      ],
    );
  }
}
