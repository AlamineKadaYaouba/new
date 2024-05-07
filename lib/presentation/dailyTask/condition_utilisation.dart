// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';

// class ConditionUtilisation extends StatefulWidget {
//   @override
//   _ConditionUtilisationState createState() => _ConditionUtilisationState();
// }

// class _ConditionUtilisationState extends State<ConditionUtilisation> {
//   late WebViewController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = WebViewController();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   bool isRead = false;
//   bool isLoading = true;

//   @override
//   Widget build(BuildContext context) {
//     InAppWebViewController? webViewController;
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Conditions d'utilisation"),
//       ),
//       // floatingActionButton: FButton(
//       //   height: 50,
//       //   text: "J'ai lu et j'accepte",
//       //   onPressed: isRead
//       //       ? () {
//       //           Navigator.of(context).pushReplacement(
//       //             MaterialPageRoute(builder: (_) => LoginPage()),
//       //           );
//       //         }
//       //       : null,
//       // ),
//       body: Stack(
//         children: [
//           isLoading
//               ? const Center(child: CircularProgressIndicator())
//               : const SizedBox(),
//           Column(
//             children: [
//               SizedBox(
//                 height: MediaQuery.of(context).size.height - 90,
//                 child: InAppWebView(
//                   initialUrlRequest: URLRequest(
//                     url: WebUri(
//                       'https://www.iubenda.com/privacy-policy/49553093',
//                     ),
//                   ),
//                   onWebViewCreated: (InAppWebViewController controller) {
//                     webViewController = controller;
//                     webViewController!.addJavaScriptHandler(
//                       callback: (args) {
//                         print(args);
//                         if (args[0] == "success") {
//                           setState(() {
//                             isLoading = false; // Hide loader on success
//                           });
//                           Navigator.pop(context, args[0]);
//                         }
//                       },
//                       handlerName: 'handlerFooWithArgs',
//                     );
//                   },
//                   onScrollChanged: (controller, x, y) {
//                     if (y >= 16628) {
//                       setState(() {
//                         // isRead = true;
//                       });
//                     }
//                   },
//                   onLoadStart: (controller, url) {
//                     isLoading = true;
//                   },
//                   onLoadStop: (controller, url) {
//                     isLoading = false;
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
