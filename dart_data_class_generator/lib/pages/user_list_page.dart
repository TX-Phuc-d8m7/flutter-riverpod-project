// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dart_data_class_generator/pages/user_detail_page.dart';
import 'package:flutter/material.dart';

import 'package:dart_data_class_generator/models/user.dart';
import 'package:dart_data_class_generator/repositories/fetch_users.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({super.key});

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  List<User> users = [];
  String error = '';
  bool loading = false;

  @override
  void initState() {
    super.initState();
    _fetchUsers();
  }

  void _fetchUsers() async {
    try {
      setState(() {
        loading = true;
      });
      users = await fetchUsers();
      error = '';
    } catch (e) {
      error = e.toString();
    } finally {
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("users")),
      body:
          loading
              ? const Center(child: CircularProgressIndicator())
              : error.isEmpty
              ? ListUsers(users: users)
              : buildError(),
    );
  }

  Widget buildError() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(error, style: TextStyle(fontSize: 18)),
            ElevatedButton(
              onPressed: _fetchUsers,
              child: const Text("Retry", style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}

class ListUsers extends StatelessWidget {
  final List<User> users;
  const ListUsers({Key? key, required this.users}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        final user = users[index];
        return ListTile(
          onTap:
              () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => UserDetailPage(user: user),
                ),
              ),
          leading: CircleAvatar(child: Text(user.id.toString())),
          title: Text(user.name),
          subtitle: Text(user.email),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider();
      },
      itemCount: users.length,
    );
  }
}
