import 'package:flutter/material.dart';

class SettingsItem extends StatelessWidget {
  const SettingsItem(
      {Key? key,
      required this.icon,
      required this.title,
      required this.routeName})
      : super(key: key);

  final IconData icon;
  final String title;
  final String routeName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 3,
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, routeName);
            },
            child: ListTile(
              leading: Icon(icon),
              title: Text(title),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
