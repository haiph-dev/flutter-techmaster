<<<<<<< HEAD
=======
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:flutter_techmaster/navigator/loginPage.dart';
<<<<<<< HEAD
// import 'cardGame/cardPage.dart';
import 'tabBar/tabPage.dart';
=======
import 'cardGame/cardPage.dart';
import 'datePicker/pickerPage.dart';
>>>>>>> origin

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // English
        Locale('vi'), // Vietnamese
      ],
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
          appBarTheme: AppBarTheme(
              backgroundColor: Colors.blue,
              titleTextStyle: TextStyle(fontSize: 25, color: Colors.white))),
      home: TabPage(),
    );
  }
}
>>>>>>> ded453c (update)
