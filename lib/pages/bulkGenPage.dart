import 'package:commanders/sharedComponents/appBar.dart';
import 'package:flutter/material.dart';

class BulkGenPage extends StatefulWidget {
  const BulkGenPage({super.key});

  @override
  State<BulkGenPage> createState() => _BulkGenPageState();
}

class _BulkGenPageState extends State<BulkGenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
    );
  }
}
