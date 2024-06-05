import 'package:bfi_prototype_web/auth.dart';
import 'package:flutter/material.dart';
import 'package:poc_client/poc_client.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

const bfiRed = Color(0xFFC50A33);
const bfiBlue = Color(0xFF003871);

// Sets up a singleton client object that can be used to talk to the server from
// anywhere in our app. The client is generated from your server code.
// The client is set up to connect to a Serverpod running on a local server on
// the default port. You will need to modify this to connect to staging or
// production servers.
var client = Client('http://$localhost:8080/')
  ..connectivityMonitor = FlutterConnectivityMonitor();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bfi Prototyp Web',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        textTheme: const TextTheme(
          headlineMedium: TextStyle(
            color: bfiBlue,
            fontWeight: FontWeight.bold,
          ),
          bodyLarge: TextStyle(
            color: bfiBlue,
            fontSize: 16,
          ),
        ),
        inputDecorationTheme: bfiInputTheme,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF003871),
          secondary: const Color(0xFFC50A33),
        ),
      ),
      home: const Banner(
        message: "Prototyp",
        location: BannerLocation.topEnd,
        child: AuthScreen(),
      ),
    );
  }
}

final InputDecorationTheme bfiInputTheme = InputDecorationTheme(
    filled: true,
    fillColor: bfiBlue.withOpacity(0.1),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide.none, // Remove default border
    ),
    focusedBorder: OutlineInputBorder(
      // When focused
      borderRadius: BorderRadius.circular(8.0),
      borderSide: const BorderSide(color: bfiBlue, width: 2.0),
    ),
    labelStyle: const TextStyle(color: bfiBlue),
    floatingLabelStyle: const TextStyle(
      // Floating label when focused
      color: bfiBlue,
    ),
    prefixIconColor: bfiBlue);
