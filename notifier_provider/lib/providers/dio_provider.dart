import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:dio/dio.dart';

part 'dio_provider.g.dart';

@riverpod
Dio dio(DioRef ref) {
  return Dio(BaseOptions(
    baseUrl: 'http://bored.api.lewagon.com/api/activity',
    // connectTimeout: const Duration(seconds: 10),
    // receiveTimeout: const Duration(seconds: 10),
  ));
}
