import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/pages/basic/basic_provider.dart';

class BasicPage extends ConsumerWidget {
  const BasicPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hello = ref.watch(helloProvider);
    final world = ref.watch(worldProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Provider')),
      body: Center(child: Text('$hello $world')),
    );
  }
}
