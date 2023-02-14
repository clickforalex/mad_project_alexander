// import 'package:flutter/material.dart';
// import 'package:mad_project_alexander/Screens/AddBookings.dart';
// import 'package:flutter/foundation.dart';
// import 'package:mad_project_alexander/Screens/ProductPage.dart';

// class DetailsPage extends StatefulWidget {
//   final Restaurant data;
//   const DetailsPage({Key key, @required this.data}) : super(key: key);

//   @override
//   State<DetailsPage> createState() => _DetailsPageState(data);
// }

// class _DetailsPageState extends State<DetailsPage> {
//   int quantity = 0;
//   final Restaurant data;

//   _DetailsPageState(this.data);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Restaurant Details'),
//         backgroundColor: Colors.green[400],
//       ),
//       body: Container(
//         padding: EdgeInsets.symmetric(horizontal: 30.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(
//               height: 20,
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   data.restaurantName,
//                   style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 30,
//                       color: Colors.green[400]),
//                 ),
//                 Text(
//                   "${data.category}",
//                   style: TextStyle(
//                     fontSize: 16,
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Center(
//               child: Container(
//                 width: 400,
//                 height: 200,
//                 decoration: BoxDecoration(
//                     image: DecorationImage(
//                         image: AssetImage("images/${data.image}"))),
//               ),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Text(
//               data.information,
//               textAlign: TextAlign.justify,
//               style: TextStyle(
//                 fontSize: 18,
//               ),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 Icon(Icons.thumbs_up_down),
//                 SizedBox(
//                   width: 20,
//                 ),
//                 IconButton(
//                   icon: Icon(
//                     Icons.thumb_up,
//                     color: Colors.green,
//                   ),
//                   onPressed: () {
//                     setState(() {
//                       ++quantity;
//                     });
//                   },
//                 ),
//                 SizedBox(
//                   width: 5,
//                 ),
//                 Text("${quantity}"),
//                 SizedBox(
//                   width: 5,
//                 ),
//                 IconButton(
//                   icon: Icon(
//                     Icons.thumb_down,
//                     color: Colors.red,
//                   ),
//                   onPressed: () {
//                     setState(() {
//                       --quantity;
//                     });
//                   },
//                 ),
//                 IconButton(
//                   icon: Icon(
//                     Icons.arrow_circle_down,
//                     color: Colors.green[400],
//                   ),
//                   onPressed: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => AddRecordPage()));
//                   },
//                 )
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
