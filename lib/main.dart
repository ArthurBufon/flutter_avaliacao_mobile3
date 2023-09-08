import 'package:flutter/material.dart';
import 'package:flutter_avaliacao_mobile3/login_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

// Color scheme.
const primaryColor = Color.fromARGB(255, 92, 50, 232);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //retira faixa debug
      title: 'Meu APP',
      theme: ThemeData(
        primaryColor: primaryColor,
        appBarTheme: const AppBarTheme(
          color: Color.fromARGB(255, 92, 50, 232),
        ),
        buttonTheme: const ButtonThemeData(
          buttonColor: Color.fromARGB(255, 92, 50, 232),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color.fromARGB(255, 92, 50, 232),
          foregroundColor: Colors.white,
        ),
      ),
      localizationsDelegates: const[
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: const[ Locale('pt', 'BR')],
      home: const LoginPage(),
    );
  }
}
