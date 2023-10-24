import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lettutor/presentation/constant.dart';
import 'package:lettutor/presentation/login/Appbar.dart';

class BookingStudent extends StatelessWidget {
  const BookingStudent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LettutorAppbar(),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        child: Column(
          children: [
            _BookingHeader(),
            const SizedBox(
              height: 32,
            ),
            _LatestBook(),
          ],
        ),
      ),
    );
  }
}

class _BookingHeader extends StatelessWidget {
  const _BookingHeader({super.key});

  @override
  Widget build(BuildContext context) {

    final headerIcon = SizedBox(
        height: 108,
        width: 108,
        child: SvgPicture.asset('/icons/calendar-check.svg',)
    );

    final headerDescription = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Schedule', style: Theme.of(context).textTheme.headlineLarge!.copyWith(
          fontWeight: FontWeight.w900,
        )),
        ExpandableText(
          sampleText,
          textAlign: TextAlign.justify,
          expandText: 'show more',
          collapseText: 'show less',
          maxLines: 3,
          linkColor: Colors.lightBlue,
        ),
      ],
    );

    return LayoutBuilder(
      builder: (context, constraints){
        if(constraints.maxWidth <= mobileWidth){
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              headerIcon,
              headerDescription,
            ],
          );
        }
        else{
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              headerIcon,
              const SizedBox(
                width: 16,
              ),
              Expanded(child: headerDescription),
            ],
          );
        }
      }
    );
  }
}

class _BookingBody extends StatelessWidget {
  const _BookingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrainst){
      if(constrainst.maxWidth <= mobileWidth){
        return Column(

        );
      }
      else{
        return Column(

        );
      }
    });
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


