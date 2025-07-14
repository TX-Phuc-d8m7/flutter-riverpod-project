import 'package:flutter/material.dart';
import 'package:riverpod_crash_course/providers/cart_provider.dart';
import 'package:riverpod_crash_course/providers/products_provider.dart';
import 'package:riverpod_crash_course/shared/cart_icon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allProducts = ref.watch(productsProvider);
    final cartProducts = ref.watch(cartNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Garage Sale Products'),
        actions: const [CartIcon()],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GridView.builder(
          itemCount: allProducts.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 0.9,
          ),
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.all(20),
              color: Colors.blueGrey.withOpacity(0.05),
              child: Column(
                children: [
                  Image.asset(allProducts[index].image, width: 40, height: 40),
                  Text(allProducts[index].title),
                  Text('${allProducts[index].price}K'),

                  if (!cartProducts.contains(allProducts[index]))
                    TextButton(
                      onPressed: () {
                        ref
                            .read(cartNotifierProvider.notifier)
                            .addToCart(allProducts[index]);
                      },
                      child: const Text(
                        'Add to Cart',
                        style: TextStyle(fontSize: 10),
                      ),
                    ),

                  if (cartProducts.contains(allProducts[index]))
                    TextButton(
                      onPressed: () {
                        ref
                            .read(cartNotifierProvider.notifier)
                            .removeFromCart(allProducts[index]);
                      },
                      child: const Text(
                        'Remove from Cart',
                        style: TextStyle(fontSize: 10),
                      ),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
