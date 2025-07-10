import 'package:flutter/material.dart';
import 'package:freezed_project/models/hotel.dart';
import 'package:freezed_project/repositories/hotel_repository.dart';

class HotelListPage extends StatefulWidget {
  const HotelListPage({super.key});

  @override
  State<HotelListPage> createState() => _HotelListPageState();
}

class _HotelListPageState extends State<HotelListPage> {
  List<Hotel> hotels = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    _fetchHotels();
  }

  Future<void> _fetchHotels() async {
    hotels = await fetchHotels();
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hotel List Page')),
      body: Center(
        child: loading ? const CircularProgressIndicator() : buildHotels(),
      ),
    );
  }

  Widget buildHotels() {
    return Padding(
      padding: EdgeInsets.all(20),
      child: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          final Hotel hotel = hotels[index];

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'name: ${hotel.name}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Text(
                "classification: ${hotel.classification}",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Text(
                "city: ${hotel.city}",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Text(
                "parking: ${hotel.parkingLotCapacity ?? 'NA'} ",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              const Divider(color: Colors.grey),

              if (hotel.reviews.isEmpty)
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    'Be the first reviewer',
                    style: TextStyle(fontSize: 20),
                  ),
                ),

              if (hotel.reviews.isNotEmpty)
                ListView.separated(
                  primary: false,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    final review = hotel.reviews[index];
                    return ListTile(
                      leading: CircleAvatar(child: Text('${review.score}')),
                      title: Text(review.review ?? "No written review"),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider(color: Colors.grey);
                  },
                  itemCount: hotel.reviews.length,
                ),
            ],
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(color: Colors.grey);
        },
        itemCount: hotels.length,
      ),
    );
  }
}
