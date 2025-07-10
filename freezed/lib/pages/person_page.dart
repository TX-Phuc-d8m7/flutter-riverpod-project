import 'package:flutter/material.dart';
import 'package:freezed_project/models/person.dart';

class PersonPage extends StatelessWidget {
  const PersonPage({super.key});

  @override
  Widget build(BuildContext context) {
    final person1 = Person(1, 'phuc', 'phuctx@gmail.com');
    print(person1);
    final person2 = Person(1, 'phuc', 'phuctx@gmail.com');
    print(person1 == person2);
    return Scaffold(appBar: AppBar(title: Text("Person")), body: Center());
  }
}
