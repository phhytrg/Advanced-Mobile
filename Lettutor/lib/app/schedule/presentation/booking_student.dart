import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lettutor/app/schedule/domain/booking_list_reponse/booking_list_response.dart';
import 'package:lettutor/app/tutors/domain/tutor_schedule/tutor_schedule_response.dart';
import 'package:lettutor/core/commom-widgets/async_value_widget.dart';
import 'package:lettutor/core/utils/date_untils.dart';

import '../../../../core/commom-widgets/button_widget.dart';
import '../../../../core/commom-widgets/page_header.dart';
import '../../../../core/commom-widgets/tutor_mini_item.dart';
import '../../../core/commom-widgets/appbar.dart';
import '../../../core/constant.dart';
import 'controller/booking_controller.dart';

class BookingStudentPage extends StatelessWidget {
  const BookingStudentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        child: Column(
          children: [
            const PageHeader(
              svgIconPath: 'icons/calendar-check.svg',
              pageDescription: sampleText,
              pageName: 'Schedule',
            ),
            const SizedBox(
              height: 32,
            ),
            _buildLatestBook(context),
            const SizedBox(
              height: 32,
            ),
            BookingListWidget(),
          ],
        ),
      ),
    );
  }

  Widget _buildLatestBook(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Latest Book',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w900),
        ),
        SizedBox(
          height: 16,
        ),
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
            TableRow(children: [
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
                    TableRow(children: [
                      const Padding(padding: EdgeInsets.all(16.0), child: Text('sample.pdf')),
                      Container(
                          padding: const EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: const BorderRadius.only(topLeft: Radius.circular(8)),
                          ),
                          child: const Text('Page')),
                      Padding(padding: EdgeInsets.all(16.0), child: Text('0')),
                    ]),
                  ]),
            ]),
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

class BookingListWidget extends ConsumerWidget {
  const BookingListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookingList = ref.watch(bookingControllerProvider);

    return AsyncValueWidget<BookingList?>(
      value: bookingList,
      data: (bookingList) {
        return bookingList == null
            ? const Text("No data")
            : ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: bookingList.rows?.length,
                itemBuilder: (context, index) {
                  return BookingItem(
                    bookingData: bookingList.rows![index],
                  );
                },
              );
      },
    );
  }
}

class BookingItem extends StatelessWidget {
  const BookingItem({super.key, required this.bookingData});

  final BookingData bookingData;

  @override
  Widget build(BuildContext context) {
    return _buildBookingBody(context);
  }

  Widget _buildLessonLine(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                    '${MyDateUtils.getHourMinute(DateTime.fromMillisecondsSinceEpoch(bookingData.scheduleDetailInfo!.startPeriodTimestamp!))} - ${MyDateUtils.getHourMinute(DateTime.fromMillisecondsSinceEpoch(bookingData.scheduleDetailInfo!.endPeriodTimestamp!))}'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(foregroundColor: Colors.red, side: BorderSide(color: Colors.red)),
                    child: Row(
                      children: [
                        Icon(Icons.cancel),
                        Text('Cancel'),
                      ],
                    )),
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
                  children: [Text('Request for lesson'), MyTextButton(child: Text('Edit Request'))],
                ),
                expandedAlignment: Alignment.centerLeft,
                children: [
                  Container(
                    color: Colors.white,
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: bookingData.studentRequest == null
                        ? Text(
                            'Currently there are no requests for this class. '
                            'Please write down any requests for the teacher.',
                            style: TextStyle(
                              color: Colors.grey.shade400,
                            ),
                          )
                        : Text(bookingData.studentRequest!),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: OutlinedButton(
                onPressed: () {},
                child: Text('Go to meeting'),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildBookingBody(BuildContext context) {
    return LayoutBuilder(builder: (context, constrainst) {
      if (constrainst.maxWidth <= mobileWidth * 2) {
        return Container(
          margin: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Colors.grey.shade200,
          ),
          child: Column(
            children: [
              Container(
                child: _buildBookingItemHeader(context),
                width: double.infinity,
              ),
              _buildLessonLine(context),
            ],
          ),
        );
      } else {
        return Container(
          margin: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Colors.grey.shade200,
          ),
          child: Row(
            children: [
              Expanded(child: _buildBookingItemHeader(context)),
              Expanded(child: _buildLessonLine(context)),
            ],
          ),
        );
      }
    });
  }

  Widget _buildBookingItemHeader(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.spaceAround,
      crossAxisAlignment: WrapCrossAlignment.start,
      spacing: 32,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                MyDateUtils.getWeekDayMonthYear(
                    DateTime.fromMillisecondsSinceEpoch(bookingData.scheduleDetailInfo!.startPeriodTimestamp!)),
                style: Theme.of(context).textTheme.titleLarge!.copyWith(),
              ),
              Text('1 lesson'),
            ],
          ),
        ),
        TutorMiniItem(
            tutorName: bookingData.scheduleDetailInfo!.scheduleInfo!.tutorInfo!.name!,
            tutorCountry: bookingData.scheduleDetailInfo!.scheduleInfo!.tutorInfo!.country!,
            tutorAvatar: bookingData.scheduleDetailInfo!.scheduleInfo!.tutorInfo!.avatar!),
      ],
    );
  }
}
