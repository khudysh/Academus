import 'package:flutter/material.dart';

class AppBarActions extends StatelessWidget {
  const AppBarActions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: PopupMenuButton<String>(
        tooltip: "Дополнительно",
        padding: EdgeInsets.zero,
        onSelected: (value) => Navigator.pushReplacementNamed(context, value),
        itemBuilder: (context) => <PopupMenuEntry<String>>[
          PopupMenuItem<String>(
            value: "/profile",
            child: ListTile(
              leading: const Icon(Icons.account_circle_sharp),
              title: Text(
                "Профиль пользователя",
              ),
            ),
          ),
          PopupMenuItem<String>(
            value: "/settings",
            child: ListTile(
              leading: const Icon(Icons.settings),
              title: Text(
                "Настройки системы",
              ),
            ),
          ),
          const PopupMenuDivider(),
          PopupMenuItem<String>(
            value: "/login",
            child: ListTile(
              leading: const Icon(Icons.logout),
              title: Text(
                "Выйти из системы",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
