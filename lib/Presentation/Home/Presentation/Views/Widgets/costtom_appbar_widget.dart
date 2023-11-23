import '../../../../../glopal.dart';
import 'package:flutter/material.dart';

class CosttomAppBarWidget extends StatelessWidget {
  const CosttomAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: IconButton(
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
        icon: Icon(
          Icons.menu,
          color:
              Global.storageService.getBoolain() ? Colors.black : Colors.black,
          shadows: [
            Shadow(
              color: Colors.white,
              offset: Offset(0, 1),
            ),
            Shadow(
              color: Colors.white,
              offset: Offset(1, 0),
            ),
          ],
        ),
      ),
      floating: true,
      actions: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.white,
              width: 2.0,
            ),
          ),
          child: CircleAvatar(
            backgroundColor: Colors.grey.withOpacity(0.2),
            child: IconButton(
              color: Colors.black,
              onPressed: () {},
              icon: const Icon(Icons.person),
            ),
          ),
        ),
        const SizedBox(width: 10)
      ],
      title: const Text(
        'ShopEaalim',
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          shadows: [
            Shadow(
              color: Colors.white,
              offset: Offset(0, 1),
            ),
            Shadow(
              color: Colors.white,
              offset: Offset(1, 0),
            ),
            Shadow(
              color: Colors.white,
              offset: Offset(0, -1),
            ),
            Shadow(
              color: Colors.white,
              offset: Offset(-1, 0),
            ),
          ],
        ),
      ),
    );
  }
}
