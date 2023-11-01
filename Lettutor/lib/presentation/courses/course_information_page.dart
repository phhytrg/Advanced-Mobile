import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/presentation/constant.dart';
import 'package:lettutor/presentation/custom-widgets/button_widget.dart';
import 'package:lettutor/presentation/appbar.dart';

import '../drawer/drawer.dart';

class CourseInformationPage extends StatefulWidget {
  const CourseInformationPage({super.key});

  @override
  State<CourseInformationPage> createState() => _CourseInformationPageState();
}

class _CourseInformationPageState extends State<CourseInformationPage> {

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
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(16.0),
            child: LayoutBuilder(
              builder: (context, constraints){
                if(constraints.maxWidth <= mobileWidth * 1.5){
                  return Column(
                    children: [
                      _buildCourseCard(context),
                      const SizedBox(
                        height: 32,
                      ),
                      _buildCourseInfo(context)
                    ],
                  );
                }else{
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: _buildCourseCard(context),
                        flex: 3,
                      ),
                      const SizedBox(
                        width: 32,
                      ),
                      Expanded(child: _buildCourseInfo(context), flex: 7,)
                    ],
                  );
                }
              },
            )
        ),
      ),
    );
  }

  Widget _buildCourseCard(BuildContext context){
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            // spreadRadius: 5,
            blurRadius: 0,
            offset: const Offset(0, 3),
          )
        ],
        borderRadius: BorderRadius.circular(16.0),
        color: Colors.white,
        border: Border.all(
          color: Colors.grey.shade300
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Image.asset('images/course-image.png', width: double.infinity, fit: BoxFit.scaleDown, )
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: Text('Basic Conversation Topics', style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.w900,
            ),),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Text('Gain confidence speaking about familiar topics'),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
            child: FilledButton(
              onPressed: (){
                Navigator.of(context).pushNamed('/course-detail');
              },
              child: Text('Discover'),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCourseInfo(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitleText(context, 'Overview'),
        Divider(),
        RichText(
          text: TextSpan(
            children: [
              WidgetSpan(child: Icon(Icons.help_outline, color: Colors.red.shade700,), alignment: PlaceholderAlignment.middle),
              TextSpan(text: 'Why take this course', style: Theme.of(context).textTheme.titleSmall!)
            ]
          )
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(sampleText, textAlign: TextAlign.justify),
        ),
        const SizedBox(
          height: 16,
        ),
        RichText(
            text: TextSpan(
                children: [
                  WidgetSpan(child: Icon(Icons.help_outline, color: Colors.red.shade700,), alignment: PlaceholderAlignment.middle),
                  TextSpan(text: 'What will you be able to do', style: Theme.of(context).textTheme.titleSmall!)
                ]
            )
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(sampleText, textAlign: TextAlign.justify),
        ),
        const SizedBox(
          height: 32,
        ),
        _buildTitleText(context, 'Experience Level'),
        Divider(),
        RichText(
            text: TextSpan(
                children: [
                  WidgetSpan(child: Icon(Icons.group_add, color: Colors.blue,), alignment: PlaceholderAlignment.middle),
                  TextSpan(text: '  '),
                  TextSpan(text: 'Beginner', style: Theme.of(context).textTheme.titleSmall!)
                ]
            )
        ),
        const SizedBox(
          height: 32,
        ),
        _buildTitleText(context, 'Course length'),
        Divider(),
        RichText(
            text: TextSpan(
                children: [
                  WidgetSpan(child: Icon(Icons.library_books, color: Colors.blue,), alignment: PlaceholderAlignment.middle),
                  TextSpan(text: '  '),
                  TextSpan(text: '10 topics', style: Theme.of(context).textTheme.titleSmall!)
                ]
            )
        ),

        const SizedBox(
          height: 32,
        ),
        _buildTitleText(context, 'List Topics'),
        Divider(),
        LayoutBuilder(builder: (context, constraints){
          if(constraints.maxWidth <= 600){
            return Column(
              children: [
                _buildTopicCard(context, '1. Foods you love'),
                _buildTopicCard(context, '2. Your jobs'),
                _buildTopicCard(context, '3. Playing and watching sports'),
                _buildTopicCard(context, '4. The Best Pet'),
                _buildTopicCard(context, '5. Having fun in your free time'),
              ],
            );
          }
          else{
            return GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                mainAxisExtent: 150, // here set custom Height You Want
              ),
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: (){},
                  borderRadius: BorderRadius.circular(8.0),
                  hoverColor: Colors.grey.shade300,
                  child: _buildTopicCard(context, '1. Colors')
                );
              },
            );
          }
        }),
        const SizedBox(
          height: 32,
        ),
        _buildTitleText(context, 'Suggested Tutors'),
        Divider(),
        Row(
          children: [
            Text('Keegan'),
            MyTextButton(child: Text('More info')),
          ],
        )
      ],
    );
  }

  Widget _buildTitleText(BuildContext context, String text){
    return Text(text,
        // Directly set font weight inside TextStyle or Theme.copyWith() will not work
        // Try passing fontWeight to GoogleFonts constructor
        style: GoogleFonts.poppins(
            fontWeight: FontWeight.w800,
            fontSize: Theme.of(context).textTheme.titleLarge!.fontSize
        )
    );
  }

  Widget _buildTopicCard(BuildContext context, String text){
    return Container(
      padding: EdgeInsets.all(16.0),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.transparent,
        border: Border.all(
          color: Colors.grey.shade300
        ),

      ),
      child: Text(text, overflow: TextOverflow.fade,),
    );
  }
}