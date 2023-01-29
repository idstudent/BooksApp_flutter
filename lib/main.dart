import 'package:books_app_flutter/screens/BookReportScreen.dart';
import 'package:books_app_flutter/ColorStyles.dart';
import 'package:books_app_flutter/screens/MyBooksScreen.dart';
import 'package:flutter/material.dart';
import 'screens/BooksScreen.dart';
import 'screens/BestSellerScreen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BottomNavigation()
    );
  }
}

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigation();
}
class _BottomNavigation extends State<BottomNavigation> {
  int selectedIndex = 0;

  final List<Widget> widgetOptions = <Widget>[
    const BooksScreen(),
    const BestSellerScreen(),
    const MyBooksScreen(),
    const BookReportScreen()
  ];

  void onTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: widgetOptions.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: '도서',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_fire_department),
            label: '베스트셀러',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: '나의 책장',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit),
            label: '독후감',
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: ColorStyles.red_dd4500,
        unselectedItemColor: Colors.black,
        onTap: onTap,
      ),
    );
  }
}