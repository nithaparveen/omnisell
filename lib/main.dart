import 'package:flutter/material.dart';
import 'package:omnisell_worksportal/presentation/login_screen/controller/login_controller.dart';
import 'package:omnisell_worksportal/presentation/login_screen/view/login_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => LoginController())
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
