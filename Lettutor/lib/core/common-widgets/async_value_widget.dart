import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AsyncValueWidget<T> extends StatelessWidget {
  const AsyncValueWidget({Key? key, required this.value, required this.data})
      : super(key: key);
  // input async value
  final AsyncValue<T> value;
  // output builder function
  final Widget Function(T) data;

  @override
  Widget build(BuildContext context) {
    return value.when(
      data: data,
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, stackTrace) => Center(
        child: Text(
          e.toString() + "\n" + stackTrace.toString(),
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: Colors.red),
        ),
      ),
    );
  }
}