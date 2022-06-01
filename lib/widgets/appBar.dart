import 'package:expense_tracker_app/menu/menu.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AppBar(
        backgroundColor: Colors.pink,
        shadowColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SettingsPage(),
                ));
              },
              icon: Icon(Icons.menu))
        ],
        title: Text("Picky wallet"),
        automaticallyImplyLeading: false,
      ),
    );
  }
}

// class CustomAppBar extends StatefulWidget {
//   const CustomAppBar({Key? key}) : super(key: key);

//   @override
//   State<CustomAppBar> createState() => _CustomAppBarState();
// }

// class _CustomAppBarState extends State<CustomAppBar> {
//   double xOffset = 0;
//   double yOffset = 0;

//   bool isDrawerOpen = false;

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedContainer(
//       transform: Matrix4.translationValues(xOffset, yOffset, 0)
//         ..scale(isDrawerOpen ? 0.85 : 1.00)
//         ..rotateZ(isDrawerOpen ? -50 : 0),
//       duration: Duration(milliseconds: 200),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius:
//             isDrawerOpen ? BorderRadius.circular(40) : BorderRadius.circular(0),
//       ),
//       child: SingleChildScrollView(
//         child: Column(
//           children: <Widget>[
//             SizedBox(
//               height: 50,
//             ),
//             Container(
//               margin: EdgeInsets.symmetric(horizontal: 20),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: <Widget>[
//                   isDrawerOpen
//                       ? GestureDetector(
//                           child: Icon(Icons.arrow_back_ios),
//                           onTap: () {
//                             setState(() {
//                               xOffset = 0;
//                               yOffset = 0;
//                               isDrawerOpen = false;
//                             });
//                           },
//                         )
//                       : GestureDetector(
//                           child: Icon(Icons.menu),
//                           onTap: () {
//                             setState(() {
//                               xOffset = 290;
//                               yOffset = 80;
//                               isDrawerOpen = true;
//                             });
//                           },
//                         ),
//                   Text(
//                     'Beautiful Drawer',
//                     style: TextStyle(
//                         fontSize: 20,
//                         color: Colors.black87,
//                         decoration: TextDecoration.none),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
