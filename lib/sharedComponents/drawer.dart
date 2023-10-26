import 'package:flutter/material.dart';

class GeneralDrawer extends StatefulWidget {
  const GeneralDrawer({super.key});

  @override
  State<GeneralDrawer> createState() => _GeneralDrawerState();
}

class _GeneralDrawerState extends State<GeneralDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Color(0xff764abc)),
            accountName: Text(
              "Bem-vindo!",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            accountEmail: Text(
              '',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.person,
                size: 40,
                color: Colors.black,
              ), //SvgPicture.asset('scryfall.svg'),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.book_rounded),
            title: const Text('Regras do REDH'),
            onTap: () {
              Navigator.pushNamed(context, "/rules");
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_chart),
            title: const Text('Gerador Bulk'),
            onTap: () async {
              await Navigator.pushNamed(context, "/bulkGen");
            },
          ),
          ListTile(
            leading: const Icon(Icons.candlestick_chart),
            title: const Text('Configurações'),
            onTap: () {
              Navigator.pushNamed(context, "/config");
            },
          ),
          ListTile(
            leading: const Icon(Icons.adb_sharp),
            title: const Text('Debug'),
            onTap: () {
              Navigator.pushNamed(context, "/debug");
            },
          )
        ],
      ),
    );
  }
}
