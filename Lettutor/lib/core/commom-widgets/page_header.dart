import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../app/presentation/constant.dart';

class PageHeader extends StatelessWidget {

  final String svgIconPath;
  final String pageDescription;
  final String pageName;
  const PageHeader({super.key, required this.svgIconPath, required this.pageDescription, required this.pageName});

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
        Text(pageName, style: Theme.of(context).textTheme.headlineLarge!.copyWith(
          fontFamily: GoogleFonts.poppins(
            fontWeight: FontWeight.w700,
          ).fontFamily,
          color: Colors.black,
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