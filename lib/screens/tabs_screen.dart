// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

// ignore: unused_import
import '../widgets/main_drawer.dart';
import './favorites_screen.dart';
import './categories_screen.dart';
import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  const TabsScreen(this.favoriteMeals, {super.key});

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  // ignore: unused_field
  late List<Map<String, Object>> _pages;
  // ignore: unused_field
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {
        'page': CategoriesScreen(),
        'title': 'Categories',
      },
      {
        'page': FavoritesScreen(widget.favoriteMeals),
        'title': 'Your Favorite',
      },
    ];
    super.initState();
  }

  // ignore: unused_element
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
                child: DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          bottom: const TabBar(
            tabs: [
              Tab(
                  text: 'In Progress',
                  icon: Icon(
                    Icons.pending_outlined,
                    // color: Colors.orange,
                  )),
              Tab(
                  text: 'Completed',
                  icon: Icon(
                    Icons.check,
                    // color: Colors.green,
                  )),
            ],
          ),
          centerTitle: true,
          title: const Text('Ticket Status'),
        ),
        body: TabBarView(
          children: [
            CategoriesScreen(),
            FavoritesScreen(widget.favoriteMeals),
          ],
        ),
      ),
    ))));
    // drawer: MainDrawer(
    // _pages[_selectedPageIndex]['page'],

    // bottomNavigationBar: BottomNavigationBar(
    //   onTap: _selectPage,
    //   backgroundColor: Theme.of(context).primaryColor,
    //   unselectedItemColor: Colors.white,
    //   selectedItemColor: Theme.of(context).colorScheme.secondary,
    //   currentIndex: _selectedPageIndex,
    //   // type: BottomNavigationBarType.fixed,
    //   items: [
    //     BottomNavigationBarItem(
    //       backgroundColor: Theme.of(context).primaryColor,
    //       icon: Icon(Icons.category),
    //       label: 'Categories',
    //     ),
    //     BottomNavigationBarItem(
    //       backgroundColor: Theme.of(context).primaryColor,
    //       icon: Icon(Icons.star),
    //       label: 'Favorites',
    //     ),
    //   ],
    // );
  }
}
