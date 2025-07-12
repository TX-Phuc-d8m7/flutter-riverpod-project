import 'package:flutter_riverpod/flutter_riverpod.dart';

final helloProvider = Provider<String>((ref) {
  ref.onDispose(() {
    print('[helloProvider] - dispose');
  });
  return "Hello 3 ";
});

final worldProvider = Provider<String>((ref) {
  ref.onDispose(() {
    print('[worldProvider] - dispose');
  });
  return "World 3";
});
