import 'package:database_trial/data/evler_data/evler_data.dart';
import 'package:database_trial/data/qovluqlar_data/qovluqlar_data.dart';
import 'package:database_trial/domain/api_clients/qovluqlar_api_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class PapkalarWidget extends StatefulWidget {
  const PapkalarWidget({super.key});

  @override
  State<PapkalarWidget> createState() => _PapkalarWidgetState();
}

class _PapkalarWidgetState extends State<PapkalarWidget> {
  final qovluqlarApiVerif = QovluqlarApiClient();
  @override
  Widget build(BuildContext context) {
    final model = context.watch<QovluqlarData>().lists;
    // final modelDelete = context.watch<QovluqlarData>().deleteList();
    final modelWatch = context.watch<QovluqlarData>();
    final watch = context.watch<SatilanEvlerData>();

    return model.isNotEmpty
        ? ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: model.length,
            itemBuilder: (BuildContext context, int index) {
              final papkalar = model[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 0.3, color: Colors.grey),
                      borderRadius: BorderRadius.circular(8)),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () async {
                              await qovluqlarApiVerif
                                  .deleteQovluq(model[index].listId);
                              modelWatch.getLists();
                              setState(() {});
                            },
                            icon: const Icon(Icons.delete)),
                        Text(
                          papkalar.listName,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 14),
                        ),
                        Row(
                          children: [
                            Text(
                              ('( ${papkalar.announceCount.toString() + ' elan'} )'),
                              style: const TextStyle(color: Colors.grey),
                            ),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    modelWatch.reloadPosts(index);
                                  });
                                  modelWatch.elanOnTap(index, context);

                                  // print(watch.posts.map((e) => e.id));
                                },
                                icon: SvgPicture.asset(
                                    'assets/images/CaretCircleRight.svg'))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          )
        : const Center(
            child: Text('ilk qovluqu yarat',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)));
  }
}
