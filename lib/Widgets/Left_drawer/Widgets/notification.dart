import 'package:flutter/material.dart';

class NotificationIcon extends StatelessWidget {
  const NotificationIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: Icon(
        Icons.notifications_outlined,
        color: Colors.white,
      ),
      itemBuilder: (context) => [
        PopupMenuItem(
          child: ListTile(
            title: Text('WQ1'),
            subtitle: Text('${DateTime.now()}'),
            trailing: Icon(Icons.delete),
            leading: Image.asset('assets/image/general.png'),
          ),
        ),
        PopupMenuItem(
          child: ListTile(
            title: Text('WQ2'),
            subtitle: Text('${DateTime.now()}'),
            trailing: Icon(Icons.delete),
            leading: Image.asset('assets/image/general.png'),
          ),
        ),
      ],
    );
  }
}
