import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'counter_provider.g.dart';

// class Counter extends AutoDisposeFamilyNotifier<int, int> {
//   @override
//   int build(int initialValue) {
//     ref.onDispose(
//       () => print(
//           'Counter disposed'), // This will print when the Counter is disposed
//     );
//     return initialValue;
//   }

//   void increment() {
//     state++;
//   }
// }

// final counterProvider = NotifierProvider.autoDispose.family<Counter, int, int>(
//   Counter.new,
// );

@riverpod
class Counter extends _$Counter {
  @override
  int build(int initialValue) {
    return initialValue;
  }

  void increment() {
    state++;
  }
}
