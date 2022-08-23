import 'package:flutter/material.dart';

class GlobalMethods {
  void navigateTo(context, widget) =>
      Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

  void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => widget,
          ), (route) {
        return false;
      });

// Widget customDropdownMenu(
//     {String ?label,
//      required dynamic value,
//       String? hintText,
//       required List<DropdownMenuItem<dynamic>> ?itemList,
//       Function (dynamic value)? onChanged}) =>
//     Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10),
//       child: InputDecorator(
//           decoration: InputDecoration(
//             labelText: label,
//             // labelStyle: const TextStyle(
//             //     color: kPrimaryColor, fontWeight: FontWeight.bold),
//             border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//           ),
//           child: DropdownButtonHideUnderline(
//             child: DropdownButton(
//               value: value,
//               hint: Text(
//                 hintText!,
//                // style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
//               ),
//               isExpanded: true,
//               items: itemList,
//               isDense: true,
//               onChanged: (value){
//                 onChanged!(value);
//               },
//             ),
//           )),
//     );

  // void showSnackBar({required String msg, required BuildContext context}) {
  //   var scaffold = Scaffold.of(context);
  //   scaffold.showSnackBar(SnackBar(content: Text(msg)));
  // }

//   void showToast({required String msg, required ToastStates state}) =>
//       Fluttertoast.showToast(
//           msg: msg,
//           toastLength: Toast.LENGTH_LONG,
//           gravity: ToastGravity.BOTTOM,
//           timeInSecForIosWeb: 5,
//           backgroundColor: chooseToastColor(state),
//           textColor: Colors.white,
//           fontSize: 16.0);

//   Color chooseToastColor(ToastStates state) {
//     Color color;
//     switch (state) {
//       case ToastStates.SUCCESS:
//         color = Colors.green;
//         break;
//       case ToastStates.ERROR:
//         color = Colors.red;
//         break;
//       case ToastStates.WARNING:
//         color = Colors.amber;
//         break;
//     }
//     return color;
//   }
// }

// enum ToastStates { SUCCESS, ERROR, WARNING }
}
