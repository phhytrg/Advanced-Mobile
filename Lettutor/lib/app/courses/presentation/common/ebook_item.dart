
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lettutor/app/courses/domain/ebook.dart';
import 'package:lettutor/core/utils/string_utils.dart';

class EbookItem extends StatelessWidget {
  const EbookItem({super.key, required this.ebook});
  final Ebook ebook;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        final router = GoRouter.of(context);
        router.pushNamed('/ebook', queryParameters: {
          'id': ebook.id.toString(),
        });
      },
      child: Container(
        width: 300,
        height: 300 * 3.8 / 3,
        margin: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
        // height: 280 * 3.8 / 3,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            border: Border.all(
              color: Colors.grey.shade400,
              width: 0.5,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                // spreadRadius: 5,
                blurRadius: 0,
                offset: Offset(0, 3),
              ),
            ],
            color: Colors.white
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 4,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Image.network(ebook.imageUrl!, fit: BoxFit.fill,)
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(ebook.name!, style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w900
                  ),),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(ebook.description!,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24.0),
              child: Text(StringUtils.numberToLevel(int.parse(ebook.level!))),
            )
          ],
        ),
      ),
    );
  }
}