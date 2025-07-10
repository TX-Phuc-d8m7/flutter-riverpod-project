import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'person.freezed.dart';

@freezed
class Person with _$Person {
  const factory Person(int id, String name, String email) = _Person;
}
