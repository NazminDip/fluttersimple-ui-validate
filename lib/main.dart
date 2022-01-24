import 'package:appvalidation/login_p.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primarySwatch: Colors.red),
    home: const LoginP(),
    routes: {
      "/login": (context) => const HomePage(),
      "/loginp": (context) => const LoginP(),
    },
  ));
}
