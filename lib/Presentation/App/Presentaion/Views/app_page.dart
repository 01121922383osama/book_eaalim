import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Books/Presentation/Views/books_page.dart';
import '../../../Home/Presentation/Views/home_page.dart';
import '../../../Settings/Presentaion/Views/settings_page.dart';
import '../Manager/TypeIndex/app_index_toggle_cubit.dart';
import 'Widgets/costtom_drawer.dart';

class AppPage extends StatelessWidget {
  const AppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppIndexToggleCubit, AppIndexToggleState>(
      builder: (context, state) => Scaffold(
        body: pages[state.index],
        drawer: const CustomDrawerPage(),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: state.index,
          onTap: (index) {
            context.read<AppIndexToggleCubit>().typeIndex(index);
          },
          elevation: 0,
          backgroundColor: Colors.red.withOpacity(0.1),
          selectedItemColor: Colors.red,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'HomePage',
              tooltip: 'HomePage',
              activeIcon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book_outlined),
              label: 'Books',
              tooltip: 'Books',
              activeIcon: Icon(Icons.book),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined),
              label: 'Settings',
              tooltip: 'Settings',
              activeIcon: Icon(Icons.settings),
            ),
          ],
        ),
      ),
    );
  }
}

List<Widget> pages = [
  const HomePage(),
  const BooksPage(),
  const SettingsPage(),
];
