import 'package:flutter/material.dart';

class RecommendedWidget extends StatelessWidget {

  final Image imageName;
  final String headerText;
  final String titleText;
  final String caloriesText;
  final String timeText;
  final String servingText;
  const RecommendedWidget(
      {required this.imageName, required this.headerText,
        required this.titleText,required this.caloriesText ,
        required this.timeText, required this.servingText,
        super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,width: 350,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
          color: Colors.grey.shade300 ),
      child:
        Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            imageName,
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 5),
              child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(headerText, style: TextStyle(color: Colors.blue),),
                  Text(titleText, textAlign: TextAlign.start),
                              Row(
                                children: [
                                  Icon(Icons.star_border_outlined, size: 20,),
                                  Icon(Icons.star_border_outlined, size: 20,),
                                  Icon(Icons.star_border_outlined, size: 20,),
                                  Icon(Icons.star_border_outlined, size: 20,),
                                  Icon(Icons.star_border_outlined, size: 20,),
                                  SizedBox(width: 5,),
                                  Text(caloriesText, style: TextStyle(fontSize: 12, color: Colors.deepOrange,
                                      fontWeight: FontWeight.bold),),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.access_alarm, size: 20,),
                                  Text(timeText, style: TextStyle(fontSize: 12)),
                                  SizedBox(width: 10,),
                                  Icon(Icons.table_bar, size: 20,),
                                  Text(servingText, style: TextStyle(fontSize: 12)),

                                ],
                              ),
                ],
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, right: 10),
                  child: Icon(Icons.favorite_outline),
                ),
              ],
            )
          ],
        )

      // ListTile(
      //   leading: imageName,
      //   minLeadingWidth: 50,
      //   trailing: Icon(Icons.favorite_outline),
      //
      //   title: Text(headerText, style: TextStyle(color: Colors.blue),),
      //   subtitle:
      //   Wrap(
      //     textDirection: TextDirection.ltr,
      //     alignment: WrapAlignment.start,
      //       children: [
      //         Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: [
      //             Text(titleText, textAlign: TextAlign.start),
      //             Row(
      //               children: [
      //                 Icon(Icons.star_border_outlined, size: 20,),
      //                 Icon(Icons.star_border_outlined, size: 20,),
      //                 Icon(Icons.star_border_outlined, size: 20,),
      //                 Icon(Icons.star_border_outlined, size: 20,),
      //                 Icon(Icons.star_border_outlined, size: 20,),
      //                 SizedBox(width: 5,),
      //                 Text(caloriesText, style: TextStyle(fontSize: 12, color: Colors.deepOrange,
      //                     fontWeight: FontWeight.bold),),
      //               ],
      //             ),
      //             Row(
      //               children: [
      //                 Icon(Icons.access_alarm, size: 20,),
      //                 Text(timeText, style: TextStyle(fontSize: 12)),
      //                 SizedBox(width: 10,),
      //                 Icon(Icons.table_bar, size: 20,),
      //                 Text(servingText, style: TextStyle(fontSize: 12)),
      //
      //               ],
      //             ),
      //           ],
      //         ),
      //       ],
      //   ),
      // ),
    );



    // child: Container(width: 300, height: 120, color: Colors.grey.shade300,
    //   child: Row( children: [
    //     Container(
    //         alignment: Alignment.centerLeft,
    //         height: 50,width: 50,
    //         child: imageName),
    //     Icon(Icons.favorite_outline, textDirection: TextDirection.rtl,),
    //
    //     Column(
    //       children: [
    //         Text(headerText),
    //         Text(titleText),
    //         Row(
    //           children: [
    //             Icon(Icons.star_border_outlined),
    //             Icon(Icons.star_border_outlined),
    //             Icon(Icons.star_border_outlined),
    //             Icon(Icons.star_border_outlined),
    //             Icon(Icons.star_border_outlined),
    //             SizedBox(width: 20,),
    //             Text(caloriesText),
    //           ],
    //         ),
    //
    //         Row(
    //           children: [
    //             Icon(Icons.access_alarm),
    //             Text(timeText),
    //             SizedBox(width: 20,),
    //             Icon(Icons.table_bar),
    //             Text(servingText),
    //
    //           ],
    //         ),
    //       ],
    //     ),
    //
    //   ],
    //   ),
    // ),





  }
}
