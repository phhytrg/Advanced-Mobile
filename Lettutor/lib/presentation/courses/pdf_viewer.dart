import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pdfx/pdfx.dart';
// import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class MyPdfViewer extends StatefulWidget {
  const MyPdfViewer({super.key});

  @override
  State<MyPdfViewer> createState() => _MyPdfViewerState();
}

class _MyPdfViewerState extends State<MyPdfViewer> {

  late PdfControllerPinch _pdfController;


  @override
  void initState(){
    
    _pdfController = PdfControllerPinch(
        document: PdfDocument.openData(_fetchPdfData('https://api.app.lettutor.com/file/be4c3df8-3b1b-4c8f-a5cc-75a8e2e6626afileFoods%20You%20Love.pdf')),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PdfViewPinch(
      controller: _pdfController,
      scrollDirection: Axis.vertical,
    );
  }

  FutureOr<Uint8List> _fetchPdfData(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return response.bodyBytes;
    } else {
      throw Exception('Failed to fetch PDF data');
    }
  }

}


// class _MyPdfViewerState extends State<MyPdfViewer> {
//   late PdfViewerController _pdfViewerController;
//   double zoomPercentage = 0.9;
//
//   @override
//   void initState() {
//     _pdfViewerController = PdfViewerController();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(8.0),
//         border: Border.all(
//           color: Colors.grey.shade300,
//         )
//       ),
//       child: Column(
//         children: [
//           Container(
//             color: Colors.grey.shade300,
//             child: Row(
//               children: [
//                 IconButton(
//                   icon: Icon(
//                     Icons.zoom_in,
//                     color: Colors.red,
//                   ),
//                   onPressed: () {
//                     _pdfViewerController.zoomLevel+=0.1;
//                     setState(() {
//                       zoomPercentage = _pdfViewerController.zoomLevel;
//                     });
//                   },
//                 ),
//                 IconButton(
//                   icon: Icon(
//                     Icons.zoom_out,
//                     color: Colors.red,
//                   ),
//                   onPressed: () {
//                     _pdfViewerController.zoomLevel -= 0.1;
//                     setState(() {
//                       zoomPercentage = _pdfViewerController.zoomLevel;
//                     });
//                   },
//                 ),
//                 Text((zoomPercentage*100).toString()),
//               ],
//             ),
//           ),
//           Expanded(
//             child: SfPdfViewer.network(
//               'https://api.app.lettutor.com/file/be4c3df8-3b1b-4c8f-a5cc-75a8e2e6626afileFoods%20You%20Love.pdf',
//               controller: _pdfViewerController,
//               initialZoomLevel: 0.9,
//
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
