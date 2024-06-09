// import 'dart:html';

import 'package:flutter/material.dart';
// import 'package:traveling_app/models/trip.dart';

import '../app_data.dart';

class TripDetailScreen extends StatelessWidget {
  final Function manageFavorite;
  const TripDetailScreen(this.manageFavorite, this.isFavorite, {super.key});
  final Function isFavorite;
  static const screenRoute = '/trip-detail';

  Widget buildSectionTitle(BuildContext context, String titleText) {
    return Container(
      margin: const EdgeInsets.all(10),
      alignment: Alignment.topRight,
      child: Text(
        titleText,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }

  Widget buildListViewContainer(Widget child) {
    return Container(
      margin: const EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      height: 200,
      padding: const EdgeInsets.all(10),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final tripId = ModalRoute.of(context)?.settings.arguments as String;
    final selectTrip = Trips_data.firstWhere((trip) => trip.id == tripId);
    final tripTitle = selectTrip.title as String;
    final imageUrl = selectTrip.imageUrl as String;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          tripTitle,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            buildSectionTitle(context, 'الأنشطــــــــة '),
            buildListViewContainer(
              ListView.builder(
                itemCount: selectTrip.activities.length,
                itemBuilder: (ctx, index) => Card(
                  elevation: .7,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text('${selectTrip.activities[index]}'),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            buildSectionTitle(context, 'البرنامج اليومــــي'),
            buildListViewContainer(
              ListView.builder(
                itemCount: selectTrip.program.length,
                itemBuilder: (ctx, index) => Column(
                  children: [
                    Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.cyan,
                          child: Text('يوم ${index + 1}'),
                        ),
                        title: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                          child: Text('${selectTrip.program[index]}'),
                        ),
                      ),
                    ),
                    // const Divider()
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 100,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          isFavorite(tripId) ? Icons.favorite : Icons.favorite_border,
        ),
        onPressed: () => manageFavorite(tripId),
      ),
    );
  }
}
