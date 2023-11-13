
import 'package:country_picker/country_picker.dart';
import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'button_widget.dart';

class TutorMiniItem extends StatelessWidget {
  final String tutorName;
  final String tutorCountry;

  const TutorMiniItem({super.key, required this.tutorName, required this.tutorCountry});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          child: Icon(Icons.portrait),
          minRadius: 48,
        ),
        SizedBox(
          width: 16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(tutorName,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.w800,
              ),
            ),
            Row(
              children: [
                Flag.fromString(tutorCountry, height: 16, width: 16*4/3, borderRadius: 4),
                SizedBox(width: 4,),
                Text(Country.tryParse(tutorCountry)!.name),
              ],
            ),
            MyTextButton(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Icon(Icons.message_rounded, size: Theme.of(context).textTheme.bodyLarge!.fontSize,),
                    ),
                    Text('Direct Message'),
                  ],
                )
            ),
          ],
        )
      ],
    );
  }
}
