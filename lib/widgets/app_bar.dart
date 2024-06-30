// import 'package:flutter/material.dart';
// import 'package:pharma_app/components/icon_component.dart';

// class MyAppBar extends StatelessWidget {
//   MyAppBar({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Theme.of(context).colorScheme.primary,
//       child: Padding(
//         padding: const EdgeInsets.fromLTRB(15, 25, 15, 15),
//         child: Expanded(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Color.fromARGB(255, 157, 222, 139),
//                     ),
//                     onPressed: () {},
//                     child: Expanded(
//                       child: Row(
//                         children: [
//                           const Icon(
//                             Icons.account_circle,
//                             color: Colors.white,
//                           ),
//                           const SizedBox(width: 8),
//                           Text(
//                             'Đăng nhập/Đăng ký',
//                             style: Theme.of(context).textTheme.titleLarge,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   Row(
//                     children: [
//                       IconComponent(
//                           icon: Icon(Icons.textsms_outlined),
//                           iconBackgroundColor: null,
//                           iconColor: Colors.white,
//                           onIconPress: () {}),
//                       IconComponent(
//                           icon: Icon(Icons.shopping_cart_outlined),
//                           iconBackgroundColor: null,
//                           onIconPress: () {},
//                           iconColor: Colors.white),
//                     ],
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 40),
//               Image.asset('assets/images/logo_home.png'),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
