// import 'package:database_trial/ui/axtaris/button_entity/checkbox_entity.dart';
// import 'package:database_trial/ui/axtaris/button_entity/filter_button_entity.dart';
// import 'package:database_trial/ui/axtaris/button_entity/range_slider_entity.dart';
// import 'package:database_trial/ui/axtaris/button_entity/swicth_cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// class KirayeListWidget extends StatefulWidget {
//   const KirayeListWidget({super.key});

//   @override
//   State<KirayeListWidget> createState() => _KirayeListWidgetState();
// }

// class _KirayeListWidgetState extends State<KirayeListWidget> {
//   // RangeLabels labels = RangeLabels('1' "750", '1' '750');
//   RangeValues values = const RangeValues(1, 750);
//   RangeValues valuesQiymet = const RangeValues(5000, 1000000);
//   // bool _switchValue = true;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           children: [
//             const Text('Şəhər :'),
//             const Text('Bakı'),
//             SvgPicture.asset('assets/images/CaretRight.svg')
//           ],
//         ),
//         Padding(
//           padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
//           child: TextField(
//             // controller: model.numberTextController,
//             // maxLength: 12,
//             decoration: InputDecoration(
//                 hintText: 'Rayon, metro, nişangah',
//                 border: const OutlineInputBorder(
//                     //Outline border type for TextFeild
//                     borderRadius: BorderRadius.all(Radius.circular(8)),
//                     borderSide: BorderSide(
//                       color: Color.fromARGB(46, 158, 158, 158),
//                       // width: 0.5,
//                     )),
//                 // isDense: true,
//                 suffixIcon: Padding(
//                   padding: const EdgeInsets.all(12.0),
//                   child: SvgPicture.asset('assets/images/CaretCircleRight.svg'),
//                 )
//                 // prefixIconConstraints:
//                 //     BoxConstraints(minWidth: 0, minHeight: 0),
//                 ),
//           ),
//         ),
//         const Divider(
//           height: 20,
//           thickness: 0.7,
//         ),
//         Padding(
//           padding: const EdgeInsets.fromLTRB(0.0, 12, 0, 24),
//           child: SizedBox(
//             width: MediaQuery.of(context).size.width - 20,
//             height: 49,
//             child: ListView(
//                 physics: const BouncingScrollPhysics(),
//                 scrollDirection: Axis.horizontal,
//                 shrinkWrap: true,
//                 children: [
//                   Row(
//                     children: [
//                       ButtonEntityWidget(
//                         // isSelected: false,
//                         height: 40,
//                         width: 85,
//                         borderRadius: 16,
//                         text: 'Mənzil',
//                       ),
//                       const SizedBox(
//                         width: 12,
//                       ),
//                       ButtonEntityWidget(
//                           // isSelected: false,
//                           height: 40,
//                           width: 98,
//                           borderRadius: 16,
//                           text: 'Yeni tikili'),
//                       const SizedBox(
//                         width: 12,
//                       ),
//                       ButtonEntityWidget(
//                           // isSelected: false,
//                           height: 40,
//                           width: 110,
//                           borderRadius: 16,
//                           text: 'Köhnə tikili'),
//                       const SizedBox(
//                         width: 12,
//                       ),
//                       ButtonEntityWidget(
//                           // isSelected: false,
//                           height: 40,
//                           width: 95,
//                           borderRadius: 16,
//                           text: 'Ev / Villa'),
//                     ],
//                   ),
//                 ]),
//           ),
//         ),
//         const Divider(
//           height: 10,
//           thickness: 0.7,
//         ),
//         Padding(
//           padding: const EdgeInsets.fromLTRB(0.0, 12, 0, 24),
//           child: SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             child: Row(
//               children: [
//                 ButtonEntityWidget(
//                     // isSelected: false,
//                     height: 40,
//                     width: 40,
//                     borderRadius: 64,
//                     text: '1'),
//                 const SizedBox(
//                   width: 12,
//                 ),
//                 ButtonEntityWidget(
//                     // isSelected: false,
//                     height: 40,
//                     width: 40,
//                     borderRadius: 64,
//                     text: '2'),
//                 const SizedBox(
//                   width: 12,
//                 ),
//                 ButtonEntityWidget(
//                     // isSelected: false,
//                     height: 40,
//                     width: 40,
//                     borderRadius: 64,
//                     text: '3'),
//                 const SizedBox(
//                   width: 12,
//                 ),
//                 ButtonEntityWidget(
//                     // isSelected: false,
//                     height: 40,
//                     width: 40,
//                     borderRadius: 64,
//                     text: '4'),
//                 const SizedBox(
//                   width: 12,
//                 ),
//                 ButtonEntityWidget(
//                     // isSelected: false,
//                     height: 40,
//                     width: 143,
//                     borderRadius: 16,
//                     text: '5+ otaqlı')
//               ],
//             ),
//           ),
//         ),
//         const Divider(
//           thickness: 0.7,
//           height: 15,
//         ),
//         const Padding(
//           padding: EdgeInsets.only(top: 8.0, bottom: 35),
//           child: Text(
//             'Sahə, m²',
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
//           ),
//         ),
//         RangeSliderWidget(
//           division: 750,
//           max: 750,
//           min: 1,
//           values: values,
//         ),
//         const Divider(
//           height: 30,
//           thickness: 0.7,
//         ),
//         const Padding(
//           padding: EdgeInsets.only(top: 8.0, bottom: 35),
//           child: Text(
//             'Qiymət, AZN',
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
//           ),
//         ),
//         RangeSliderWidget(
//           division: 1000000,
//           max: 1000000,
//           min: 5000,
//           values: valuesQiymet,
//         ),
//         const Divider(
//           height: 15,
//           thickness: 0.7,
//         ),
//         SwitchEntityWidget(
//           text: 'Cixaris var',
//           // isSelected: false,
//         ),
//         const SizedBox(
//           height: 8,
//         ),
//         SwitchEntityWidget(
//           text: 'Abunelere elave et',
//           // isSelected: false,
//         ),
//         const SizedBox(
//           height: 8,
//         ),
//         SwitchEntityWidget(
//           text: 'Ipoteka var',
//           // isSelected: false,
//         ),
//         Padding(
//           padding: const EdgeInsets.only(top: 16.0),
//           child: Row(
//             children: [
//               ButtonEntityWidget(
//                   // isSelected: false,
//                   height: 50,
//                   width: 167,
//                   borderRadius: 8,
//                   text: 'İlkin ödəniş'),
//               const SizedBox(
//                 width: 8,
//               ),
//               ButtonEntityWidget(
//                   // isSelected: false,
//                   height: 50,
//                   width: 167,
//                   borderRadius: 8,
//                   text: 'Aylıq ödəniş'),
//             ],
//           ),
//         ),
//         const Divider(
//           height: 20,
//           thickness: 0.7,
//         ),
//         const Text(
//           'Mərtəbə',
//           style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
//         ),
//         const SizedBox(
//           height: 8,
//         ),
//         SizedBox(
//           height: 80,
//           width: MediaQuery.of(context).size.width,
//           child: Padding(
//             padding: const EdgeInsets.fromLTRB(0.0, 12, 0, 24),
//             child: ListView(
//               shrinkWrap: true,
//               scrollDirection: Axis.horizontal,
//               physics: const BouncingScrollPhysics(),
//               children: [
//                 ButtonEntityWidget(
//                     // isSelected: false,
//                     height: 40,
//                     width: 40,
//                     borderRadius: 64,
//                     text: '1'),
//                 const SizedBox(
//                   width: 12,
//                 ),
//                 ButtonEntityWidget(
//                     // isSelected: false,
//                     height: 40,
//                     width: 40,
//                     borderRadius: 64,
//                     text: '2'),
//                 const SizedBox(
//                   width: 12,
//                 ),
//                 ButtonEntityWidget(
//                     // isSelected: false,
//                     height: 40,
//                     width: 40,
//                     borderRadius: 64,
//                     text: '3'),
//                 const SizedBox(
//                   width: 12,
//                 ),
//                 ButtonEntityWidget(
//                     // isSelected: false,
//                     height: 40,
//                     width: 40,
//                     borderRadius: 64,
//                     text: '4'),
//                 const SizedBox(
//                   width: 12,
//                 ),
//                 ButtonEntityWidget(
//                     // isSelected: false,
//                     height: 40,
//                     width: 40,
//                     borderRadius: 64,
//                     text: '5'),
//                 const SizedBox(
//                   width: 12,
//                 ),
//                 ButtonEntityWidget(
//                     // isSelected: false,
//                     height: 40,
//                     width: 40,
//                     borderRadius: 64,
//                     text: '6'),
//                 const SizedBox(
//                   width: 12,
//                 ),
//                 ButtonEntityWidget(
//                     // isSelected: false,
//                     height: 40,
//                     width: 40,
//                     borderRadius: 64,
//                     text: '7'),
//                 const SizedBox(
//                   width: 12,
//                 ),
//                 ButtonEntityWidget(
//                     // isSelected: false,
//                     height: 40,
//                     width: 40,
//                     borderRadius: 64,
//                     text: '8'),
//               ],
//             ),
//           ),
//         ),
//         CheckboxEntityWidget(
//           text: 'Ən üst olmasın',
//           // isSelected: false,
//         ),
//         const SizedBox(
//           height: 8,
//         ),
//         CheckboxEntityWidget(
//           text: 'Yalnız ən üst',
//           // isSelected: false,
//         ),
//         const SizedBox(
//           height: 8,
//         ),
//         CheckboxEntityWidget(
//           text: '1-ci olmasın',
//           // isSelected: false,
//         ),
//         const Divider(
//           height: 30,
//           thickness: 0.7,
//         ),
//         const Text(
//           'Mərtəbə sayı',
//           style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
//         ),
//         const SizedBox(
//           height: 8,
//         ),
//         SizedBox(
//           height: 80,
//           width: MediaQuery.of(context).size.width,
//           child: Padding(
//             padding: const EdgeInsets.fromLTRB(0.0, 12, 0, 24),
//             child: ListView(
//               shrinkWrap: true,
//               scrollDirection: Axis.horizontal,
//               physics: const BouncingScrollPhysics(),
//               children: [
//                 ButtonEntityWidget(
//                     // isSelected: false,
//                     height: 40,
//                     width: 40,
//                     borderRadius: 64,
//                     text: '1'),
//                 const SizedBox(
//                   width: 12,
//                 ),
//                 ButtonEntityWidget(
//                     // isSelected: false,
//                     height: 40,
//                     width: 40,
//                     borderRadius: 64,
//                     text: '2'),
//                 const SizedBox(
//                   width: 12,
//                 ),
//                 ButtonEntityWidget(
//                     // isSelected: false,
//                     height: 40,
//                     width: 40,
//                     borderRadius: 64,
//                     text: '3'),
//                 const SizedBox(
//                   width: 12,
//                 ),
//                 ButtonEntityWidget(
//                     // isSelected: false,
//                     height: 40,
//                     width: 40,
//                     borderRadius: 64,
//                     text: '4'),
//                 const SizedBox(
//                   width: 12,
//                 ),
//                 ButtonEntityWidget(
//                     // isSelected: false,
//                     height: 40,
//                     width: 40,
//                     borderRadius: 64,
//                     text: '5'),
//                 const SizedBox(
//                   width: 12,
//                 ),
//                 ButtonEntityWidget(
//                     // isSelected: false,
//                     height: 40,
//                     width: 40,
//                     borderRadius: 64,
//                     text: '6'),
//                 const SizedBox(
//                   width: 12,
//                 ),
//                 ButtonEntityWidget(
//                     // isSelected: false,
//                     height: 40,
//                     width: 40,
//                     borderRadius: 64,
//                     text: '7'),
//                 const SizedBox(
//                   width: 12,
//                 ),
//                 ButtonEntityWidget(
//                     // isSelected: false,
//                     height: 40,
//                     width: 40,
//                     borderRadius: 64,
//                     text: '8'),
//               ],
//             ),
//           ),
//         ),
//         const Divider(
//           height: 15,
//           thickness: 0.7,
//         ),
//         const SizedBox(
//           height: 10,
//         ),
//         SwitchEntityWidget(
//           text: 'Emlak sahibinden',
//           // isSelected: false,
//         ),
//         const SizedBox(
//           height: 30,
//         )
//       ],
//     );
//   }
// }
