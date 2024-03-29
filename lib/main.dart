import 'package:commanders/models/ConfigModel.dart';
import 'package:commanders/pages/bulkGenPage.dart';
import 'package:commanders/pages/configPage.dart';
import 'package:commanders/pages/debugPage.dart';
import 'package:commanders/pages/mainPage.dart';
import 'package:commanders/pages/rulesPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ConfigModel(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: const Color.fromRGBO(43, 37, 58, 1)),
      ),
      routes: {
        "/": (context) => const MyApp(),
        "/debug": (context) => const DebugPage(),
        "/config": (context) => const ConfigPage(),
        "/bulkGen": (context) => const BulkGenPage(),
        "/rules": (context) => const RulesPage(),
      },
      initialRoute: "/",
    ),
  ));
}
