import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/pages/auto_dispose_family/auto_dispose_family_provider.dart';

class AutoDisposeFamilyPage extends ConsumerWidget {
  const AutoDisposeFamilyPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final helloPhucTX = ref.watch(autoDisposeFamilyHelloProvider('PhucTX'));
    final helloLyNTK = ref.watch(autoDisposeFamilyHelloProvider('LyNTK'));

    ref.watch(counterProvider(Counter(count: 0)));
    ref.watch(counterProvider(Counter(count: 0)));

    return Scaffold(
      appBar: AppBar(title: const Text('AutoDisposeFamilyProvider')),
      body: Center(
        child: Column(
          children: [
            Text(helloPhucTX, style: Theme.of(context).textTheme.headlineLarge),
            Text(helloLyNTK, style: Theme.of(context).textTheme.headlineLarge),
          ],
        ),
      ),
    );
  }
}
