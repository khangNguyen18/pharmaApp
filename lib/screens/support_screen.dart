// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:iconly/iconly.dart';
// //import 'package:pharma_app/components/icon_component.dart';
// //import 'package:pharma_app/components/title_component.dart';

// class SupportScreen extends StatefulWidget {
//   const SupportScreen({super.key});

//   @override
//   State<SupportScreen> createState() => _SupportScreenState();
// }

// class _SupportScreenState extends State<SupportScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         toolbarHeight: 90,
//         backgroundColor: Theme.of(context).colorScheme.primary,
//         title: TitleComponent(
//           text: 'Hỗ trợ',
//         ),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(20),
//         child: Container(
//           height: 280,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10),
//             color: Color.fromARGB(255, 255, 255, 255),
//             border: Border.all(
//               color: Theme.of(context).colorScheme.primary,
//               width: 1.0,
//             ),
//           ),
//           child: Stack(children: [
//             Container(
//               height: 200,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(10),
//                   topRight: Radius.circular(10),
//                 ),
//                 color: const Color.fromARGB(255, 238, 255, 241),
//               ),
//               child: Image(
//                 image: AssetImage('assets/images/support.png'),
//               ),
//             ),
//             Align(
//                 alignment: Alignment.bottomLeft,
//                 child: Row(
//                   children: [
//                     Column(
//                       children: [Text('coloum'),
//                       Icon(IconlyLight.filter)],
                      
//                     ),
//                     Text('data'),
//                   ],
//                 )),
//           ]),
//         ),
//       ),
//     );
//   }
// }
