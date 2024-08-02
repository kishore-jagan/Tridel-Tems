import 'package:flutter/material.dart';

PreferredSize bar(BuildContext context) => PreferredSize(
    preferredSize: const Size.fromHeight(kToolbarHeight + 10),
    child: AppBar(
      automaticallyImplyLeading: false,
      iconTheme: const IconThemeData(color: Colors.white),
      backgroundColor: Colors.lightBlue,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      title: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Container(
              width: 80,
              height: 60,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'assets/image/Tridel-logo.png',
                    ),
                    fit: BoxFit.fitHeight),
              ),
            ),
          ),
          const Text(
            'TEMS',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 36,
            ),
          ),
        ],
      ),
      actions: <Widget>[
        Builder(builder: (BuildContext context) {
          return IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(Icons.menu),
          );
        })
      ],
    ));
