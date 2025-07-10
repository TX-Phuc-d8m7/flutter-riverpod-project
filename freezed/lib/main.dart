import 'package:flutter/material.dart';
import 'package:freezed_project/models/person.dart';
import 'package:freezed_project/pages/hotel_list_page.dart';
import 'package:freezed_project/pages/mutable_person_page.dart';
import 'package:freezed_project/pages/person_page.dart';
import 'package:freezed_project/widgets/customButton.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          padding: EdgeInsets.all(20),
          shrinkWrap: true,
          children: [
            CustomButton(title: "Test", child: PersonPage()),
            CustomButton(title: "Mutatble", child: MutablePersonPage()),
            CustomButton(title: "Hotel", child: HotelListPage()),
          ],
        ),
      ),
    );
  }
}
