import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lettutor/presentation/constant.dart';

class PageHeader extends StatelessWidget {

  final String svgIconPath;
  final String pageDescription;
  const PageHeader({super.key, required this.svgIconPath, required this.pageDescription});

  @override
  Widget build(BuildContext context) {

    final headerIcon = SizedBox(
        height: 108,
        width: 108,
        child: SvgPicture.asset(svgIconPath,)
    );

    final headerDescription = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Schedule', style: Theme.of(context).textTheme.headlineLarge!.copyWith(
          fontWeight: FontWeight.w900,
        )),
        ExpandableText(
          pageDescription,
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