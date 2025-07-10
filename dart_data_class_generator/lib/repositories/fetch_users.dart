import 'package:dart_data_class_generator/models/user.dart';
import 'package:dio/dio.dart';

Future<List<User>> fetchUsers() async {
  try {
    await Future.delayed(const Duration(seconds: 2));
    final dio = Dio();
    final Response response = await dio.get(
      'https://jsonplaceholder.typicode.com/users',
    );
    final List userList = response.data;
    print(userList[0]);

    final users = [for (final user in userList) User.fromMap(user)];
    print(users[0]);
    return users;
  } catch (e) {
    rethrow;
  }
}
