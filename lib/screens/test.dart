// import 'package:flutter/material.dart';
// import 'package:srm_test/settings/adaptive.dart';
// const defaultPadding = 16.0;


// class DashboardScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: SingleChildScrollView(
//         padding: EdgeInsets.all(defaultPadding),
//         child: Column(
//           children: [
//             Header(),
//             SizedBox(height: defaultPadding),
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Expanded(
//                   flex: 5,
//                   child: Column(
//                     children: [
//                       MyFiles(),
//                       SizedBox(height: defaultPadding),
//                       RecentFiles(),
//                       if (isDisplaySmallDesktop(context))
//                         SizedBox(height: defaultPadding),
//                       if (isDisplaySmallDesktop(context)) StarageDetails(),
//                     ],
//                   ),
//                 ),
//                 if (!isDisplaySmallDesktop(context))
//                   SizedBox(width: defaultPadding),
//                 // On Mobile means if the screen is less than 850 we dont want to show it
//                 if (!isDisplaySmallDesktop(context))
//                   Expanded(
//                     flex: 2,
//                     child: StarageDetails(),
//                   ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }