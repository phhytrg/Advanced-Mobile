import 'package:expandable_text/expandable_text.dart';
import 'package:flag/flag.dart';
import 'package:flag/flag_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lettutor/presentation/constant.dart';
import 'package:lettutor/presentation/custom-widgets/button_widget.dart';
import 'package:lettutor/presentation/custom-widgets/page_header.dart';
import 'package:lettutor/presentation/custom-widgets/tutor_mini_item.dart';
import 'package:lettutor/presentation/appbar.dart';

class BookingStudentPage extends StatelessWidget {
  const BookingStudentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LettutorAppbar(),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          child: Column(
            children: [
              PageHeader(svgIconPath: 'icons/calendar-check.svg', pageDescription: sampleText),
              const SizedBox(
                height: 32,
              ),
              _LatestBook(),
              const SizedBox(
                height: 32,
              ),
              _BookingBody(),
            ],
          ),
        ),
      ),
    );
  }
}

class _LatestBook extends StatelessWidget {
  const _LatestBook({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Latest Book',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.w900
          ),
        ),
        SizedBox(height: 16,),
        Table(
          columnWidths: const {
            0: FlexColumnWidth(1),
            1: FlexColumnWidth(3),
          },
          border: TableBorder.all(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(8),
          ),
          children: [
            TableRow(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(8)),
                    ),
                    padding: const EdgeInsets.all(16.0),
                    child: Text('Name'),
                  ),
                  Table(
                      defaultColumnWidth: IntrinsicColumnWidth(),
                      border: TableBorder.symmetric(
                        inside: BorderSide(
                          color: Colors.black12,
                        ),
                      ),
                      children: [
                        TableRow(
                            children: [
                              const Padding(padding: EdgeInsets.all(16.0),
                                  child: Text('sample.pdf')),
                              Container(
                                  padding: const EdgeInsets.all(16.0),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(8)),
                                  ),
                                  child: const Text('Page')
                              ),
                              Padding(padding: EdgeInsets.all(16.0),
                                  child: Text('0')),
                            ]
                        ),
                      ]
                  ),
                ]
            ),
            TableRow(
              children: [
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(8)),
                  ),
                  child: Text('Description'),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(''),
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}

class _BookingBody extends StatelessWidget {
  _BookingBody({super.key});



  @override
  Widget build(BuildContext context) {
    final bookingItemHeader = Wrap(
      alignment: WrapAlignment.spaceAround,
      crossAxisAlignment: WrapCrossAlignment.start,
      spacing: 32,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Thu, 26 Oct 23',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.w900,
                ),
              ),
              Text('1 lesson'),
            ],
          ),
        ),
        TutorMiniItem(tutorName: 'Keegan', tutorCountry: 'TN')
      ],
    );

    final decoration = BoxDecoration(
      borderRadius: BorderRadius.circular(8.0),
      color: Colors.grey.shade200,
    );

    return LayoutBuilder(builder: (context, constrainst){
      if(constrainst.maxWidth <= mobileWidth * 2){
        return Container(
          decoration: decoration,
          child: Column(
            children: [
              Container(child: bookingItemHeader, width: double.infinity,),
              _LessonLine(),
            ],
          ),
        );
      }
      else{
        return Container(
          decoration: decoration,
          child: Row(
            children: [
              Expanded(child: bookingItemHeader),
              Expanded(child: _LessonLine()),
            ],
          ),
        );
      }
    });
  }
}

class _LessonLine extends StatelessWidget {
  const _LessonLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('00:00 - 00:25'),
              OutlinedButton(
                onPressed: (){},
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.red,
                  side: BorderSide(
                    color: Colors.red
                  )
                ),
                child: Row(
                  children: [
                    Icon(Icons.cancel),
                    Text('Cancel'),
                  ],
                )
              ),
            ],
          ),
          Card(
            color: Colors.grey.shade100,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: ListTileTheme(
              contentPadding: EdgeInsets.all(0),
              dense: true,
              child: ExpansionTile(
                shape: Border(),
                tilePadding: EdgeInsets.symmetric(horizontal: 8),
                controlAffinity: ListTileControlAffinity.leading,
                initiallyExpanded: true,
                clipBehavior: Clip.antiAlias,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Request for lesson'),
                    MyTextButton(child: Text('Edit Request'))
                  ],
                ),
                expandedAlignment: Alignment.centerLeft,
                children: [
                  Container(
                    color: Colors.white,
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text('Currently there are no requests for this class. Please write down any requests for the teacher.')
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}



