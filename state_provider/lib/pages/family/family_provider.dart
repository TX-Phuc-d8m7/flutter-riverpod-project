import 'package:flutter_riverpod/flutter_riverpod.dart';

final familyCounterProvider =
    StateProvider.family<int, int>((ref, initialValue) {
  ref.onDispose(() {
    print(
        '[familyCounterProvider($initialValue) disposed'); // do something when the widget is disposed
  });
  return initialValue;
});
