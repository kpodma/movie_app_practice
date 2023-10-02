import 'package:movie_app_practice/pages/favorites_page/favorites_page.dart';
import 'package:movie_app_practice/pages/top_movies_page/top_movies_page.dart';
import 'package:movie_app_practice/pages/top_tv_page/top_tv_page.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_practice/pages/movies_page/movies_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_practice/di/service_locator.dart';
import 'package:movie_app_practice/pages/favorites_page/favorite_cubit/favorite_cubit.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentPageIndex = 0;
  final PageController _pageController = PageController();

  void _onItemTapped(int index) {
    setState(() {
      _currentPageIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt.get<FavoriteCubit>(),
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            'MovieApp',
          ),
        ),
        body: SizedBox.expand(
          child: PageView(
            controller: _pageController,
            children: const [
              MoviesPage(),
              TopMoviesPage(),
              TopTvPage(),
              FavoritesPage(),
            ],
            onPageChanged: (index) {
              setState(() {
                _currentPageIndex = index;
              });
            },
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: 'Top Movies',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.stars_outlined),
              label: 'Top TV',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorites',
            ),
          ],
          currentIndex: _currentPageIndex,
          selectedItemColor: Colors.amber,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
