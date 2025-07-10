import 'package:flutter/material.dart';
import 'package:freezed_project/models/mutable_person.dart';

class MutablePersonPage extends StatelessWidget {
  const MutablePersonPage({super.key});

  @override
  Widget build(BuildContext context) {
    final person1 = MutablePerson(1, "phuc", 20);
    person1.name = "phuc2";
    person1.age = 21;
    print(person1);
    return Scaffold(appBar: AppBar(title: Text("Mutable Page")));
  }
}
