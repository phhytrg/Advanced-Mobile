import 'package:flutter/material.dart';
import '../../../core/commom-widgets/appbar.dart';
import '../../../core/commom-widgets/drawer.dart';
import '../../../core/constant.dart';
import 'pdf_viewer.dart';

class PdfViewerPage extends StatelessWidget {
  const PdfViewerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyPdfViewer();
  }
}
