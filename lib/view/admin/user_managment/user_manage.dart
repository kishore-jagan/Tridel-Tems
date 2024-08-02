// import 'package:flutter/material.dart';
// import 'package:temsmobile/Widgets/Appbar/appbar.dart';

// import '../../../Widgets/Left_drawer/drawer_left.dart';
// import 'tabs/user_create.dart';

// class UserManagment extends StatefulWidget {
//   const UserManagment({super.key});

//   @override
//   State<UserManagment> createState() => _UserManagmentState();
// }

// class _UserManagmentState extends State<UserManagment>
//     with TickerProviderStateMixin {
//   late TabController _tabController;
//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 2, vsync: this);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: bar(context),
//       drawer: const DrawerLeft(),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//           Text(
//             'User Action Log',
//           ),
//           const Row(
//             children: [
//               Text('Home | '),
//               Text('User Action Log'),
//             ],
//           ),
//           Expanded(
//             child: UserCreation(),
//           )
//         ]),
//       ),
//     );
//   }
// }
