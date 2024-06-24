import 'package:flutter/material.dart';
import 'package:zoja_test/module/transaction.dart';
import 'package:zoja_test/route/page.dart';
import 'package:zoja_test/route/route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zoja Test',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoute.transactionPage,
      onGenerateRoute: AppPage.generateRoute,
    );
  }
}
