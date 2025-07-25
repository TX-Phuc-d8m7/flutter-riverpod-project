import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:future_provider/pages/users/user_detail_page.dart';
import 'package:future_provider/pages/users/user_providers.dart';

class UserListPage extends ConsumerWidget {
  const UserListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userList = ref.watch(userListProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('User List')),
      // body: switch (userList) {
      //   AsyncData(value: final users) => ListView.separated(
      //     itemCount: users.length,
      //     separatorBuilder: (BuildContext context, int index) {
      //       return const Divider();
      //     },
      //     itemBuilder: (BuildContext context, int index) {
      //       final user = users[index];

      //       return ListTile(
      //         leading: CircleAvatar(child: Text(user.id.toString())),
      //         title: Text(user.name),
      //       );
      //     },
      //   ),
      //   AsyncError(error: final e) => Center(
      //     child: Text(
      //       e.toString(),
      //       style: const TextStyle(fontSize: 20, color: Colors.red),
      //     ),
      //   ),

      //   _ => const Center(child: CircularProgressIndicator()),
      // },
      body: userList.when(
        data: (users) {
          return RefreshIndicator(
            onRefresh: () async => ref.invalidate(userListProvider),
            color: Colors.red,
            child: ListView.separated(
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: users.length,
              separatorBuilder: (BuildContext context, int index) {
                return const Divider();
              },
              itemBuilder: (BuildContext context, int index) {
                final user = users[index];

                return ListTile(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) {
                          return UserDetailPage(userId: user.id);
                        },
                      ),
                    );
                  },
                  leading: CircleAvatar(child: Text(user.id.toString())),
                  title: Text(user.name),
                );
              },
            ),
          );
        },
        error: (e, st) {
          return Center(
            child: Text(
              e.toString(),
              style: const TextStyle(fontSize: 20, color: Colors.red),
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
