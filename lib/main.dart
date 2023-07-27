import 'package:flutter/material.dart';
import 'package:flutter_techmaster/provider/catalogPage.dart';
import 'package:flutter_techmaster/provider/model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => CatalogModel()),
        ChangeNotifierProvider(create: (_) => CartModel()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: CatalogPage(),
      ),
    );
  }
}
