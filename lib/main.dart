import 'package:flutter/material.dart';
import 'package:registration_demo/Screens/Login%20Screen/login_screen.dart';
import 'package:registration_demo/Screens/Splash%20Screen/splash_screen.dart';
// import 'package:registration_demoo/Login Screen/login_screen.dart';
// import 'package:registration_demoo/Home Screen/home_screen.dart';
// import 'package:registration_demoo/Registration Screen/registration_screen.dart';
// import 'package:registration_demoo/Notification Screen/notification_screen.dart';
// import 'package:registration_demoo/Location Screen/location_screen.dart';
// import 'Splash Screen/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Registration Demo',
      theme: ThemeData(
      brightness: Brightness.light,
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          color: Color.fromARGB(255, 147, 147, 231),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        dialogBackgroundColor: Color.fromARGB(255, 100, 100, 200),
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(
          color: Color.fromARGB(255, 100, 100, 200),
        ),
      ),
      themeMode: ThemeMode.system,
      home: SplashScreen(), 
      debugShowCheckedModeBanner: false,// Change this to your initial screen if needed
      routes: {
        '/login': (context) => LoginScreen(),
        // '/register': (context) => RegistrationScreen(),
        // '/home': (context) => HomeScreen(),
        // '/notifications': (context) => NotificationScreen(),
        // '/location': (context) => LocationScreen(),
      },
    );
  }
}
