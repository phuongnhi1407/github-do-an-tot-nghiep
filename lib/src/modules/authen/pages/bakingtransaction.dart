// import 'package:doantotnghiep/src/modules/authen/dtos/request/bakingtransaction_request.dart';
// import 'package:doantotnghiep/src/modules/authen/provider/authen_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// class BakingTransactionScreen extends StatefulWidget {
//   const BakingTransactionScreen({Key? key}) : super(key: key);
//
//   @override
//   _BakingTransactionScreenState createState() => _BakingTransactionScreenState();
// }
//
// class _BakingTransactionScreenState extends State<BakingTransactionScreen> {
//   final _userIdController = TextEditingController();
//   final _pointController = TextEditingController();
// // authen baking
//   AuthenProvider? authenProvider;
//   @override
//   void initState() {
//     super.initState();
//     authenProvider = Provider.of<AuthenProvider>(context, listen: false);
//   }
//   void hanleBaking(
//       {String? userId,
//         String? point,
//         }) async {
//     BakingRequest request = BakingRequest(
//         userId: userId,
//         point: point,
//         timeZone: DateTime.now().toString());
//     await authenProvider?.fetchBakingTransaction(context, request);
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Nạp tiền'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             TextField(
//               controller: _userIdController,
//               keyboardType: TextInputType.number,
//               decoration: InputDecoration(
//                 labelText: 'User ID',
//               ),
//             ),
//             SizedBox(height: 20),
//             TextField(
//               controller: _pointController,
//               keyboardType: TextInputType.number,
//               decoration: InputDecoration(
//                 labelText: 'Point',
//               ),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 // Gọi phương thức nạp tiền từ AuthenProvider
//                 Provider.of<AuthenProvider>(context, listen: false)
//                     .recharge(
//                   userId: int.tryParse(_userIdController.text) ?? 0,
//                   point: int.tryParse(_pointController.text) ?? 0,
//                   // isSuccess: true, // Bạn có thể set giá trị này theo yêu cầu của ứng dụng
//                 );
//               },
//               child: Text('Nạp tiền'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }