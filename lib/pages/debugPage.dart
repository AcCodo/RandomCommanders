import 'package:commanders/models/ConfigModel.dart';
import 'package:commanders/sharedComponents/appBar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DebugPage extends StatefulWidget {
  const DebugPage({super.key});

  @override
  State<DebugPage> createState() => _DebugPageState();
}

class _DebugPageState extends State<DebugPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      body: SingleChildScrollView(
        child: Consumer<ConfigModel>(
          builder: (context, value, child) {
            return Text(value.recentCalls.join());
          },
        ),
      ),
    );
  }
}
