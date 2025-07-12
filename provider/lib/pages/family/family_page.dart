import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/pages/family/family_provider.dart';

class FamilyPage extends ConsumerWidget {
  const FamilyPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final helloPhucTX = ref.watch(familyHelloProvider('PhucTX'));
    final helloLyNTK = ref.watch(familyHelloProvider('KimNTK'));
    return Scaffold(
      appBar: AppBar(title: const Text('FamilyProvider')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              helloPhucTX,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(helloLyNTK, style: Theme.of(context).textTheme.headlineMedium),
          ],
        ),
      ),
    );
  }
}
