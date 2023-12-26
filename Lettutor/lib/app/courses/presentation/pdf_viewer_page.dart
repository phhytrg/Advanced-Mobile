import 'package:flutter/material.dart';
import 'package:lettutor/app/courses/presentation/common/pdf_viewer.dart';
import '../../../core/commom-widgets/appbar.dart';
import '../../../core/commom-widgets/drawer.dart';
import '../../../core/constant.dart';

class PdfViewerPage extends StatelessWidget {
  const PdfViewerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyPdfViewer();
  }
}
