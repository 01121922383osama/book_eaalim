import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class CustomDrawerPage extends StatelessWidget {
  const CustomDrawerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width / 1.5,
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Colors.red.withOpacity(0.7),
            ),
            currentAccountPicture: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 2, color: Colors.white),
              ),
              child: const CircleAvatar(
                child: Icon(
                  Icons.person,
                  color: Colors.redAccent,
                  size: 35,
                ),
              ),
            ),
            accountName: const Text(
              'Osama Nabil',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    color: Colors.grey,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
            ),
            accountEmail: const Text(
              'osama854@gmail.com',
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    color: Colors.grey,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
            ),
          ),
          _buildListTile(
            title: 'All the Books',
            iconData: Icons.menu_book_sharp,
            onTap: () {},
          ),
          const Divider(),
          _buildListTile(
            title: 'Rateing',
            iconData: Icons.star_sharp,
            onTap: () {},
          ),
          const Divider(),
        ],
      ),
    ).animate().shimmer(
        angle: 45,
        duration: Duration(seconds: 2),
        color: Colors.white.withOpacity(0.1));
  }
}

Widget _buildListTile({
  required String title,
  required IconData iconData,
  required void Function()? onTap,
}) {
  return ListTile(
    onTap: onTap,
    leading: CircleAvatar(
      backgroundColor: Colors.grey.withOpacity(0.5),
      child: Icon(
        iconData,
        color: Colors.redAccent,
      ),
    ),
    title: Text(title),
  );
}
