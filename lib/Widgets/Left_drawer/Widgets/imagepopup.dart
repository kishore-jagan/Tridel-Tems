import 'package:flutter/material.dart';

import '../../../Api Services/logout_service.dart';

class ImagePopUp extends StatefulWidget {
  const ImagePopUp({super.key});

  @override
  State<ImagePopUp> createState() => _ImagePopUpState();
}

class _ImagePopUpState extends State<ImagePopUp> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final RenderBox overlay =
            Overlay.of(context).context.findRenderObject() as RenderBox;
        final RelativeRect position = RelativeRect.fromRect(
            Rect.fromPoints(
              Offset.zero,
              overlay.size.bottomRight(Offset.zero),
            ),
            Offset.zero & overlay.size);

        showMenu(context: context, position: position, items: [
          PopupMenuItem(
              child: ListTile(
            title: const Text('Powered by'),
            subtitle: const Text('Tridel Technologies'),
            trailing: const Icon(Icons.delete),
            leading: Image.asset('assets/image/Tridel-logo.png'),
          )),
          PopupMenuItem(
              child: ListTile(
            title: TextButton(
              onPressed: () {
                LogoutService().logout();
              },
              child: const Text(
                'Log out',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ))
        ]);
      },
      child: Container(
        height: 80,
        width: 80,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/image/admin.png'), fit: BoxFit.cover),
        ),
      ),
    );
  }
}
