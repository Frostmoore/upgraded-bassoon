import 'package:agenzia_x/assets/constants.dart' as constants;
import 'package:agenzia_x/firebase_options.dart';
import 'package:agenzia_x/home.dart';
import 'package:agenzia_x/sections/web_view_container.dart';
import 'package:agenzia_x/sections/chiamata_rapida.dart';
import 'package:flutter/material.dart';
import 'package:agenzia_x/firebase_options.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> _messageHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  RemoteNotification? notification = message.notification;
  if (notification != null) {
    //print("Notification received when app in background");
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(_messageHandler);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const MyHomePage(title: constants.TITLE),
        '/webViewContainer': (context) => const WebViewContainer()
      },
      title: constants.TITLE,
      theme: ThemeData(
        colorScheme: const ColorScheme.highContrastLight(),
        useMaterial3: true,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(constants.TITLE),
          ],
        ),
      ),
      body: const HomePage(),
      floatingActionButton: const ChiamataRapida(),
    );
  }
}
