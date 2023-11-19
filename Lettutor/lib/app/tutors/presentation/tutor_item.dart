import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:lettutor/app/tutors/domain/tutor.dart';

class TutorItem extends StatelessWidget {
  final Tutor tutor;
  const TutorItem({super.key, required this.tutor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed('/tutor');
      },
      child: Container(
        constraints: BoxConstraints(
          maxWidth: 3.5 * 125,
          minWidth: 3.5 * 50,
        ),
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.black12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Center(
                      child: CircleAvatar(
                        minRadius: 40,
                        child: tutor.avatar != null ? ClipOval(
                          child: Image.network(
                            tutor.avatar!,
                            fit: BoxFit.cover,
                            width: 80,
                            height: 80,
                            errorBuilder: (context, error, stackTrace) => const Icon(Icons.person),
                          ),
                        ) : const Icon(Icons.person),
                      ),
                    ),
                  ],
                ),
                Positioned(
                    right: 0,
                    top: 0,
                    child: Icon(
                      Icons.favorite,
                      color: Colors.red,
                    )),
              ],
            ),
            Text(
              tutor.name!,
              textAlign: TextAlign.start,
            ),
            tutor.country != null ? Wrap(
              children: [
                Flag.fromString(
                  tutor.country!,
                  height: 20,
                  width: 20 * 4 / 3,
                  fit: BoxFit.scaleDown,
                  borderRadius: 8,
                ),
                tutor.country != null ? Text(tutor.country!) : const Text(''),
              ],
            ) : const Text(''),

            Wrap(
              children: [
                Icon(Icons.star),
                Icon(Icons.star),
                Icon(Icons.star),
                Icon(Icons.star),
                Icon(Icons.star),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                Container(
                    decoration: BoxDecoration(
                      color: Colors.blue[100]!.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    child: Text(
                      'English for Bussiness',
                      style: TextStyle(
                        color: Colors.blue[800],
                      ),
                    )),
                Container(
                    decoration: BoxDecoration(
                      color: Colors.blue[100]!.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    child: Text(
                      'English for kids',
                      style: TextStyle(
                        color: Colors.blue[800],
                      ),
                    )),
                Container(
                    decoration: BoxDecoration(
                      color: Colors.blue[100]!.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    child: Text(
                      'IELTS',
                      style: TextStyle(
                        color: Colors.blue[800],
                      ),
                    )),
                Container(
                    decoration: BoxDecoration(
                      color: Colors.blue[100]!.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    child: Text(
                      'STARTERS',
                      style: TextStyle(
                        color: Colors.blue[800],
                      ),
                    )),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'I am passionate about running and fitness, I often compete in trail/mountain running events and I love pushing myself. I am training to one day take part in ultra-endurance events. I also enjoy watching rugby on the weekends, reading and watching podcasts on Youtube. My most memorable life experience would be living in and traveling around Southeast Asia.',
              textAlign: TextAlign.justify,
              overflow: TextOverflow.ellipsis,
              maxLines: 5,
            ),
            const SizedBox(
              height: 24,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: FittedBox(
                child: OutlinedButton(
                    onPressed: () {},
                    child: const Row(
                      children: [
                        Icon(Icons.schedule_send),
                        SizedBox(
                          width: 8,
                        ),
                        Text('Book')
                      ],
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
