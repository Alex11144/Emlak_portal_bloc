import 'package:database_trial/data/evler_data/evler_data.dart';
import 'package:database_trial/ui/axtaris/nisangahlar/toggle_buttons_lists.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../button_entity/room_count_entity.dart';

class BakiOrNotWidget extends StatelessWidget {
  const BakiOrNotWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final watch = context.watch<SatilanEvlerData>();

    return watch.cityId == '1'
        ? Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => NisangahlarLists())));
              },
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 0.5),
                    borderRadius: BorderRadius.circular(8)),
                width: MediaQuery.of(context).size.width - 24,
                height: 48,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Rayon, metro, nişangah',
                          style: TextStyle(color: Colors.grey),
                        ),
                        SvgPicture.asset('assets/images/CaretCircleRight.svg')
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        : SizedBox.shrink();
    // queryParameters.cityId == '1'
    //     ? const Divider(
    //         height: 20,
    //         thickness: 0.7,
    //       )
    //     : SizedBox(
    //         height: 10,
    //       );
  }
}
