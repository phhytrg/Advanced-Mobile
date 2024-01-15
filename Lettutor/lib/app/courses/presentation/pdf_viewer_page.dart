import 'package:flutter/material.dart';
import 'package:lettutor/app/courses/presentation/common/pdf_viewer.dart';

class PdfViewerPage extends StatelessWidget {
  final String url;
  const PdfViewerPage({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return MyPdfViewer(url: url,);
  }
}
