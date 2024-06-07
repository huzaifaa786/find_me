// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class DropdownItem {
//   final String text;
//   final String avatarUrl;
//   final bool verified;

//   DropdownItem({
//     required this.text,
//     required this.avatarUrl,
//     this.verified = false,
//   });
// }

// class HomeDropDown extends StatefulWidget {
//   final List<DropdownItem> items;
//   final DropdownItem selectedItem;
//   final ValueChanged<DropdownItem> onChanged;

//   const HomeDropDown({
//     Key? key,
//     required this.items,
//     required this.selectedItem,
//     required this.onChanged,
//   }) : super(key: key);

//   @override
//   _HomeDropDownState createState() => _HomeDropDownState();
// }

// class _HomeDropDownState extends State<HomeDropDown> {
//   bool _isDropdownOpened = false;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         GestureDetector(
//           onTap: () {
//             setState(() {
//               _isDropdownOpened = !_isDropdownOpened;
//             });
//           },
//           child: Container(
//             padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
//             decoration: BoxDecoration(
//               border: Border.all(color: Colors.grey),
//               borderRadius: BorderRadius.circular(0.r),
//             ),
//             child: Column(
//               children: [
               
//                 Text(widget.selectedItem.text),
//                 Spacer(),
//                 Icon(
//                   _isDropdownOpened ? Icons.arrow_drop_up : Icons.arrow_drop_down,
//                   color: Colors.grey,
//                 ),
//               ],
//             ),
//           ),
//         ),
//         if (_isDropdownOpened)
//           Container(
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.only(
//                 bottomLeft: Radius.circular(20),
//                 bottomRight: Radius.circular(20),
//               ),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.5),
//                   spreadRadius: 2,
//                   blurRadius: 5,
//                   offset: Offset(0, 3),
//                 ),
//               ],
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: widget.items.map((item) {
//                 return GestureDetector(
//                   onTap: () {
//                     widget.onChanged(item);
//                     setState(() {
//                       _isDropdownOpened = false;
//                     });
//                   },
//                   child: Container(
//                     padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                     child: Row(
//                       children: [
//                         CircleAvatar(
//                           backgroundImage: NetworkImage(item.avatarUrl),
//                           radius: 15,
//                         ),
//                         SizedBox(width: 10),
//                         Text(item.text),
//                         Spacer(),
//                         if (item.verified)
//                           Icon(Icons.verified, color: Colors.green),
//                       ],
//                     ),
//                   ),
//                 );
//               }).toList(),
//             ),
//           ),
//       ],
//     );
//   }
// }
