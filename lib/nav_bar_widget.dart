import 'package:avaproject/account_screen.dart';
import 'package:avaproject/calendar_page.dart';
import 'package:avaproject/category_page.dart';
import 'package:avaproject/eventlist_page.dart';
import 'package:avaproject/main_page.dart';
import 'package:flutter/material.dart';

class NavBarWidget extends StatefulWidget {
  const NavBarWidget({super.key});

  @override
  State<NavBarWidget> createState() => _NavBarWidget();
}

class _NavBarWidget extends State<NavBarWidget> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    MainPage(), // твоя главная страница
    EventCategoryScreen(), // экран категорий
    EventListScreen(), // можно заменить на реальные экраны
    CalendarPage(),
    AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home,color:Colors.black), label: 'Главная'),
          BottomNavigationBarItem(icon: Icon(Icons.grid_view,color:Colors.black), label: 'Категории',),
          BottomNavigationBarItem(icon: Icon(Icons.add,color:Colors.black), label: 'Создать'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today,color:Colors.black), label: 'Календарь'),
          BottomNavigationBarItem(icon: Icon(Icons.person,color:Colors.black), label: 'Аккаунт'),
        ],
      ),
    );
  }
}
