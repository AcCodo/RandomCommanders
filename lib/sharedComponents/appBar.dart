import 'package:commanders/constants.dart';
import 'package:flutter/material.dart';

AppBar myAppBar() {
  return AppBar(
    title: Text("Random Commander v${VersionConstants.version}"),
  );
}
