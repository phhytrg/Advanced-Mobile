import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/presentation/constant.dart';
import 'package:lettutor/presentation/courses/PdfViewerPage.dart';
import 'package:lettutor/presentation/courses/pdf_viewer.dart';
import 'package:lettutor/presentation/login/appbar.dart';

class CourseDetailPage extends StatefulWidget {
  const CourseDetailPage({super.key});

  @override
  State<CourseDetailPage> createState() => _CourseDetailPageState();
}

class _CourseDetailPageState extends State<CourseDetailPage> {
  var _selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LettutorAppbar(),
      body: LayoutBuilder(
        builder: (context, constraints){
          if(constraints.maxWidth <= mobileWidth){
            return SingleChildScrollView(
              child: Column(
                children: [
                  _buildListTopicsSelection(context),
                  const SizedBox(
                    height: 32,
                  ),
                ],
              ),
            );
          }
          else{
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 1,child: _buildListTopicsSelection(context),),
                const SizedBox(
                  width: 32,
                ),
                Expanded(flex: 3,child: MyPdfViewer()),
              ],
            );
          }
        },
      ),
    );
  }

  Widget _buildListTopicsSelection(BuildContext context){
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset('assets/images/course-image.png'),
          const SizedBox(
            height: 32.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 24.0),
            child: Text('Basic Conversation Topics',
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w600).fontFamily,
            ),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 32.0),
            child: Text('Gain confidence speaking about familiar topics',),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
            child: Text('List Topics',
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w600).fontFamily
            ),),
          ),
          ListView.builder(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index){
            return ListTile(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(32), bottomLeft: Radius.circular(32)),
              ),
              tileColor: _selectedIndex == index ? Colors.grey.shade300 : null,
              title: RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w500).fontFamily
                  ),
                  children: [
                    TextSpan(text: index.toString() +'.  '),
                    TextSpan(text: 'Foods you love'),
                  ]
                ),
              ),
              onTap: (){
                setState(() {
                  _selectedIndex = index;
                });

                if(MediaQuery.of(context).size.width <= mobileWidth){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PdfViewerPage()),
                  );
                }
                else{

                }
              },
            );
          })
        ]
      ),
    );
  }
}
