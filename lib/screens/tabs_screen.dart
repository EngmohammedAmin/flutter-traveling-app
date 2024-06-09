import 'package:flutter/material.dart';
import '../models/trip.dart';
import '../widgets/app_drawer.dart';
import './categories_screen.dart';
import './favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Trip> favoriteTrips;
  const TabsScreen(this.favoriteTrips, {super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  int _selectedScreenIndex = 0;
  late List<Map<String, dynamic>> _screens;
  @override
  void initState() {
    _screens = [
      {
        'Screen': const CategoriesScreen(),
        'Title': 'تصنيفات الرحلات',
      },
      {
        'Screen': FavoritesScreen(widget.favoriteTrips),
        'Title': ' الرحلات المفضلة',
      },
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          _screens[_selectedScreenIndex]['Title']!,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      drawer: const AppDrawer(),
      body: _screens[_selectedScreenIndex]['Screen']!,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedScreenIndex,
        items: const [
          BottomNavigationBarItem(
            tooltip: 'التصنيفات',
            icon: Icon(
              Icons.dashboard,
              // color: Colors.amber,
            ),
            label: 'التصنيفات',
          ),
          BottomNavigationBarItem(
            tooltip: 'المفضلات',
            icon: Icon(
              Icons.star,
              // color: Colors.amber,
            ),
            label: 'المفضلات',
          )
        ],
      ),
    );
  }
}














//طريقة أخرى باستخدام ستيتلس ويدجت ولكن هذا التاب يعرض فوق الصفحة
// import 'package:flutter/material.dart';
// import '../screens/categories_screen.dart';
// import 'favorites_screen.dart';

// class TabsScreen extends StatelessWidget {
//   const TabsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text(' الدليل السياحي'),
//           bottom: const TabBar(
//             labelColor: Colors.cyan,
//             tabs: [
//               Tab(
//                 icon: Icon(Icons.dashboard),
//                 text: 'التصنيفات',
//               ),
//               Tab(
//                 icon: Icon(Icons.star),
//                 text: 'المفضلة',
//               ),
//             ],
//           ),
//         ),
//         body: const TabBarView(
//           children: [
//             CategoriesScreen(),
//             FavoritesScreen(),
//           ],
//         ),
//       ),
//     );
//   }
// }
