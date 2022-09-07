import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class myDrawer extends StatelessWidget {
  const myDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageUrl =
        "https://scontent.fstv12-1.fna.fbcdn.net/v/t39.30808-6/269913656_3754237091468769_6674582852430067854_n.jpg?stp=dst-jpg_s720x720&_nc_cat=104&ccb=1-7&_nc_sid=e3f864&_nc_ohc=VFriv9hEVw8AX-PNchs&_nc_ht=scontent.fstv12-1.fna&oh=00_AT-lmA-TEoR-9Dlofu18zevwyB937x0SKc2XhwJN2XojHA&oe=6307EEE0";

    return Drawer(
      //shadow jevu karva mate elevation use thai
      child: Container(
        color: Colors.deepPurple,
        child: ListView(padding: EdgeInsets.zero, children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              // decoration: BoxDecoration(
              //   color: Color.fromARGB(255, 35, 189, 209),
              //   ),
              margin: EdgeInsets.zero,
              accountName: const Text("Neel Rana"),
              accountEmail: const Text("neel@gamail.com"),
              // currentAccountPicture: Image.network(imageUrl),
              currentAccountPicture:
                  CircleAvatar(backgroundImage: NetworkImage(imageUrl)),
            ),
          ),
          const ListTile(
            leading: Icon(
              CupertinoIcons.home,
              color: Colors.white,
            ),
            title: Text(
              "Home",
              style: TextStyle(color: Colors.white),
            ),
          ),
          const ListTile(
            leading: Icon(
              CupertinoIcons.profile_circled,
              color: Colors.white,
            ),
            title: Text(
              "Profile",
              style: TextStyle(color: Colors.white),
            ),
          ),
          const ListTile(
            leading: Icon(
              CupertinoIcons.mail,
              color: Colors.white,
            ),
            title: Text(
              "Email Me",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ]),
      ),
    );
  }
}
