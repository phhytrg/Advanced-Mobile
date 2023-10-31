import 'package:flutter/material.dart';
import 'package:lettutor/presentation/courses/pdf_viewer.dart';
import 'package:lettutor/presentation/login/appbar.dart';

class PdfViewerPage extends StatelessWidget {
  const PdfViewerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LettutorAppbar(),
      body: MyPdfViewer(),
    );
  }
}
