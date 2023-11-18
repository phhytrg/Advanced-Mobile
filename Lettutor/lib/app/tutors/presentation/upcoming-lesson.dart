
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UpcomingLesson extends StatelessWidget {
  const UpcomingLesson({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(8, 32, 8, 32),
      margin: EdgeInsets.only(left: 8, right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.blue.shade900,
      ),
      child: Column(
        children: [
          Text(
            "Upcoming Lesson",
            style: TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Expanded(
                child: Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    const Text(
                      textAlign: TextAlign.center,
                      'Thu, 26 Oct 23 03:30 - 03:55',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      '(starts in 97:43:35)',
                      style: TextStyle(
                        color: Colors.yellow[300],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: (){},
                  child: Text(
                    'Enter lesson room',
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            'Total lesson time is 507 hours 55 minutes',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
