import 'package:flutter/material.dart';
import 'package:lettutor/presentation/constant.dart';
import 'package:lettutor/presentation/common/button_widget.dart';
import 'package:lettutor/presentation/common/page_header.dart';
import 'package:lettutor/presentation/common/tutor_mini_item.dart';
import 'package:lettutor/presentation/appbar.dart';

import '../drawer/drawer.dart';


class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {

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
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          child: Column(
            children: [
              PageHeader(
                svgIconPath: 'icons/history.svg',
                pageDescription: sampleText,
                pageName: 'History',),
              const SizedBox(
                height: 32,
              ),
              HistoryItem(),
            ],
          ),
        ),
      ),
    );
  }
}

class HistoryItem extends StatelessWidget {
  const HistoryItem({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.grey.shade200,
      ),
      child: LayoutBuilder(builder: (context, constraints){
        if(constraints.maxWidth <= mobileWidth * 2){
          return Column(
            children: [
              Container(
                alignment: Alignment.center,
                child: _buildItemHeader(context),
                padding: EdgeInsets.all(16.0),
                width: double.infinity,
              ),
              _buildItemBody(context),
            ],
          );
        }
        else{
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: _buildItemHeader(context),
              ),
                flex: 1,
              ),
              Expanded(child: _buildItemBody(context), flex: 2,),
            ],
          );
        }
      }),
    );
  }

  Widget _buildItemHeader(BuildContext context){
    return Wrap(
      alignment: WrapAlignment.spaceAround,
      spacing: 32,
      runSpacing: 8,
      children: [
        Column(
          children: [
            Text('Thu, 26 Oct 23', style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.w900,
            ),),
            Text('19 hours ago'),
          ],
        ),
        TutorMiniItem(tutorName: 'Keegan', tutorCountry: 'TN'),
      ],
    );
  }

  Widget _buildItemBody(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          padding: EdgeInsets.all(8.0),
          margin: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          color: Colors.white,
          child: Row(
            children: [
              Text('Lesson Time: 01:30 - 03:25'),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(8.0),
          margin: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 1),
          color: Colors.white,
          child: Row(
            children: [
              Text('No request for lesson'),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(8.0),
          margin: EdgeInsets.symmetric(vertical: 1, horizontal: 16),
          color: Colors.white,
          child: Row(
            children: [
              Text('Tutor haven\'t reviewed yet'),
            ],
          ),
        ),
        Container(
            padding: EdgeInsets.all(8.0),
            margin: EdgeInsets.only(top: 1, bottom: 16, right: 16, left: 16),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyTextButton(child: Text('Add a rating')),
                MyTextButton(child: Text('Report')),
              ],
            )
        ),
      ],
    );
  }
}

