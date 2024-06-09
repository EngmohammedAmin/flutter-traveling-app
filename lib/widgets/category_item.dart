import 'package:flutter/material.dart';
import 'package:traveling_app/screens/category_trips_screen.dart';
// import '../screens/category_trips_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  // final String categoryTitle;
  // final String categoryId;

  const CategoryItem({
    super.key,
    required this.id,
    required this.title,
    required this.imageUrl,
    // required this.categoryId,
    // required this.categoryTitle,
  });
  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(CategoryTripsScreen.screenRoute, arguments: {
      'id': id,
      'title': title,
      // 'image': imageUrl,
    });
    //طريقة أخرى
    // Navigator.of(ctx).push(
    //   MaterialPageRoute(
    //     builder: (c) => CategoryTripsScreen(
    //       categoryId: id,
    //       categoryTitle: title,
    //       imageUrl: imageUrl,
    //     ),
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(10),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              imageUrl,
              height: 250,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.4),

              // color: Colors.amber,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              title,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          )
        ],
      ),
    );
  }
}
