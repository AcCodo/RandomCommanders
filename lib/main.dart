import 'package:commanders/pages/bulkGenPage.dart';
import 'package:commanders/pages/configPage.dart';
import 'package:commanders/pages/debugPage.dart';
import 'package:commanders/pages/mainPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    ),
    routes: {
      "/": (context) => const MyApp(),
      "/debug": (context) => const DebugPage(),
      "/config": (context) => const ConfigPage(),
      "/bulkGen": (context) => const BulkGenPage(),
    },
    initialRoute: "/",
  ));
}
