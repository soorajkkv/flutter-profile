import 'package:flutter/material.dart';
 
import '../colors.dart';
 
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
 @override
 Widget build(BuildContext context) {
   return AppBar(
     flexibleSpace: Row(
       crossAxisAlignment: CrossAxisAlignment.center,
       mainAxisSize: MainAxisSize.max,
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: [
         Expanded(child: _menuIcon()),
         Column(
           mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.center,
           children: [
             Padding(
               padding: const EdgeInsets.only(top: 20.0),
               child: Image.asset(
                 'assets/icons/logo.png',
                 height: 60,
                 width: 60,
                 fit: BoxFit.contain,
               ),
             ),
             Text(
               'Trinity Mar Thoma Church, Houston',
               style: TextStyle(
                 color: itemSubTextColor,
                 fontSize: 16.0,
                 fontFamily: 'Homenaje',
                 fontWeight: FontWeight.w600,
               ),
             )
           ],
         ),
         Expanded(
           child: Container(
             margin: EdgeInsets.only(right: 36.0),
             alignment: Alignment.centerRight,
             child: Stack(
               clipBehavior: Clip.none,
               children: <Widget>[
                 ClipOval(
                   child: Image.asset('assets/person4.png',
                       height: 32, width: 32),
                 ),
                 Positioned(
                   left: 24,
                   child: ClipOval(
                     child: Image.asset('assets/person5.png',
                         height: 32, width: 32),
                   ),
                 ),
               ],
             ),
           ),
         ),
       ],
     ),
     elevation: 0.0,
     backgroundColor: Colors.white,
   );
 }
 
 Container _menuIcon() {
   return Container(
     padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
     child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       mainAxisSize: MainAxisSize.min,
       children: [
         Container(
           width: 13,
           height: 2,
           color: menuColor,
         ),
         SizedBox(
           height: 6.0,
         ),
         Container(
           width: 21,
           height: 2,
           color: menuColor,
         ),
         SizedBox(
           height: 6.0,
         ),
         Container(
           width: 13,
           height: 2,
           color: menuColor,
         ),
       ],
     ),
   );
 }
 
 @override
 Size get preferredSize => Size.fromHeight(87.0);
}
