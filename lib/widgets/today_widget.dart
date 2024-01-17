import 'package:flutter/material.dart';

class TodayWidget extends StatelessWidget {

  final Image imageName;
  final String headerText;
  final String titleText;
  final String caloriesText;
  final String timeText;
  final String servingText;
  const TodayWidget(
      { required this.imageName, required this.headerText,
    required this.titleText,required this.caloriesText ,
        required this.timeText, required this.servingText,
        super.key});

  @override
  Widget build(BuildContext context) {
       return
    Padding(
      padding: const EdgeInsets.fromLTRB(15, 5, 0, 0),
      child: Stack(

        children: [
          Column(
          children: [
            Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.favorite_outline,) ,
                Transform.translate( offset: Offset(30, 0),
                   child: imageName),
              ],

            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    // margin: EdgeInsets.fromLTRB(10, 0, 180, 0),
                    child: Text(headerText, style: TextStyle(color: Colors.blue,),textAlign: TextAlign.left,), ),
                SizedBox(height: 3,),
                Container(
                    // margin: EdgeInsets.fromLTRB(10, 0, 80, 0),
                    child: Text(titleText, textAlign: TextAlign.start)),
                SizedBox(height: 3,),
                Container(
                  // margin: EdgeInsets.fromLTRB(20, 0, 110, 0),
                  child: Row(
                    children: [
                      Icon(Icons.star_border_outlined, size: 20,),
                      Icon(Icons.star_border_outlined, size: 20,),
                      Icon(Icons.star_border_outlined, size: 20,),
                      Icon(Icons.star_border_outlined, size: 20,),
                      Icon(Icons.star_border_outlined, size: 20,),
                    ],
                  ),
                ),
                SizedBox(height: 3,),
                Container(
                    // margin: EdgeInsets.fromLTRB(20, 0, 180, 0),
                    child: Text(caloriesText,
                      style: TextStyle(fontSize: 12, color: Colors.deepOrange, fontWeight: FontWeight.bold),)),
                SizedBox(height: 3,),
                Container(
                  // margin: EdgeInsets.fromLTRB(20, 0, 80, 0),
                  child: Row(
                    children: [
                      Icon(Icons.access_alarm, size: 20,),
                      Text(timeText, style: TextStyle(fontSize: 12)),
                      SizedBox(width: 10,),
                      Icon(Icons.table_bar, size: 20,),
                      Text(servingText, style: TextStyle(fontSize: 12)),

                    ],
                  ),
                ),
              ],
            ),
          ],

        )],
      ),
    );



  }
}
//   Padding(
//   padding: const EdgeInsets.only(left: 15, top: 15),
//   child: Row(
//     children: [
//       Flexible(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Icon(Icons.favorite_outline,),
//             Container(
//               // margin: EdgeInsets.fromLTRB(10, 0, 180, 0),
//               child: Text(headerText, style: TextStyle(color: Colors.blue,),textAlign: TextAlign.left,), ),
//             Container(
//               // margin: EdgeInsets.fromLTRB(10, 0, 80, 0),
//                 child: Text(titleText, textAlign: TextAlign.start)),
//             Container(
//               // margin: EdgeInsets.fromLTRB(20, 0, 110, 0),
//               child: Row(
//                 children: [
//                   Icon(Icons.star_border_outlined, size: 20,),
//                   Icon(Icons.star_border_outlined, size: 20,),
//                   Icon(Icons.star_border_outlined, size: 20,),
//                   Icon(Icons.star_border_outlined, size: 20,),
//                   Icon(Icons.star_border_outlined, size: 20,),
//                 ],
//               ),
//             ),
//             Container(
//               // margin: EdgeInsets.fromLTRB(20, 0, 180, 0),
//                 child: Text(caloriesText,
//                   style: TextStyle(fontSize: 12, color: Colors.deepOrange, fontWeight: FontWeight.bold),)),
//             Container(
//               // margin: EdgeInsets.fromLTRB(20, 0, 80, 0),
//               child: Row(
//                 children: [
//                   Icon(Icons.access_alarm, size: 20,),
//                   Text(timeText, style: TextStyle(fontSize: 12)),
//                   SizedBox(width: 10,),
//                   Icon(Icons.table_bar, size: 20,),
//                   Text(servingText, style: TextStyle(fontSize: 12)),
//
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//       Transform.translate( offset: Offset(50, 0),
//           child: imageName)
//         ],
//       ),
// );
