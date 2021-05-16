// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:siginsignup/pages/LearningMaterialPage.dart';
// import 'package:siginsignup/pages/PackagesPage.dart';
// import 'package:siginsignup/pages/homepage.dart';
// import 'package:siginsignup/pages/studentProfile.dart';

// Widget ConstBottomAppBar(BuildContext context) {
//   return BottomAppBar(
//     color: Colors.white,
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       mainAxisSize: MainAxisSize.max,
//       children: [
//         IconButton(
//           onPressed: () {
//             Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => PackagesPage(),
//                 ));
//           },
//           icon: Icon(
//             Icons.home,
//             size: 23,
//             color: Colors.blue[300],
//           ),
//         ),
//         IconButton(
//           onPressed: () {
//             Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => HomePage(),
//                 ));
//           },
//           icon: Icon(
//             Icons.search,
//             size: 25,
//             color: Colors.blue[300],
//           ),
//         ),
//         IconButton(
//           onPressed: () {
//             Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => LearingMaterialPage(),
//                 ));
//           },
//           icon: Icon(
//             Icons.school,
//             size: 23,
//             color: Colors.blue[300],
//           ),
//         ),
//         IconButton(
//           onPressed: () {
//             Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => LearingMaterialPage(),
//                 ));
//           },
//           icon: Icon(
//             Icons.chat,
//             size: 23,
//             color: Colors.blue[300],
//           ),
//         ),
//         IconButton(
//           onPressed: () {
//             Navigator.pop(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => StudentProfile(),
//                 ));
//           },
//           icon: Icon(
//             Icons.settings,
//             size: 23,
//             color: Colors.red,
//           ),
//         ),
//       ],
//     ),
//   );
// }
