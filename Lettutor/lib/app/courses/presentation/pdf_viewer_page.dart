import 'package:flutter/material.dart';
import 'package:lettutor/app/courses/presentation/common/pdf_viewer.dart';
import '../../../core/commom-widgets/appbar.dart';
import '../../../core/commom-widgets/drawer.dart';
import '../../../core/constant.dart';

class PdfViewerPage extends StatefulWidget {
  const PdfViewerPage({super.key});

  @override
  State<PdfViewerPage> createState() => _PdfViewerPageState();
}

class _PdfViewerPageState extends State<PdfViewerPage> {

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {


    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      key: _scaffoldKey,
      appBar: LettutorAppbar(
        onMenuIconPressed: (){
          _scaffoldKey.currentState?.openEndDrawer();
        },
      ),
      endDrawer: width - 40 <= titleWidth ? LettutorDrawer() : null,
      body: MyPdfViewer(),
    );
  }
}
