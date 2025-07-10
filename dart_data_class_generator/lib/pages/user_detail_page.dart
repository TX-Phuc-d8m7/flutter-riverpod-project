// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:dart_data_class_generator/models/user.dart';

class UserDetailPage extends StatelessWidget {
  final User user;
  const UserDetailPage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: true, title: Text(user.name)),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('👤 Name: ${user.name}'),
                Text('📧 Email: ${user.email}'),
                Text('📱 Phone: ${user.phone}'),
                Text('🌐 Website: ${user.website}'),
              ],
            ),
          ),
          Container(
            color: Colors.amber,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: ShowAddress(address: user.address),
          ),
          Container(
            color: Colors.blue,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: ShowCompany(company: user.company),
          ),
        ],
      ),
    );
  }
}

class ShowAddress extends StatelessWidget {
  final Address address;

  const ShowAddress({Key? key, required this.address}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Address', style: Theme.of(context).textTheme.headlineMedium),
        Text('Street: $address.street'),
        Text('Suite: $address.suite'),
        Text('City: $address.street'),
        Text('ZipCode: $address.suite'),
        Row(
          textDirection: TextDirection.ltr,
          children: [
            Text('Latitude: $address.geo.lat'),
            Text('Longitude: $address.geo.lng'),
          ],
        ),
      ],
    );
  }
}

class ShowCompany extends StatelessWidget {
  final Company company;
  const ShowCompany({Key? key, required this.company}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Address', style: Theme.of(context).textTheme.headlineMedium),
        Text('Street: $company.name'),
        Text('Suite: $company.catchPhrase'),
        Text('City: $company.bs'),
      ],
    );
  }
}
