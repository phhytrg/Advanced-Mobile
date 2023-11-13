import 'package:flutter/material.dart';

//ignore: must_be_immutable
class MySearchBar extends TextField {

  String hintText;
  MySearchBar({
    super.key,
    super.onSubmitted,
    this.hintText = ''
  }): super(
    decoration: InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(
        color: Colors.grey.shade400,
      ),
      isDense: true,
      contentPadding: EdgeInsets.zero,
      prefixIcon: const Icon(Icons.search),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.0),
        borderSide: BorderSide(
          color: Colors.grey.shade300,
        )
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.0),
        borderSide: const BorderSide(
          color: Colors.blue,
        ),
      ),
    ),
    textInputAction: TextInputAction.search,
  );
}

// class MySearchBar extends StatelessWidget {
//   const MySearchBar({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }

