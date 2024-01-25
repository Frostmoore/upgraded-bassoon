import 'package:agenzia_x/assets/constants.dart' as constants;
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:agenzia_x/firebase_options.dart';
import 'package:agenzia_x/home.dart';
import 'package:agenzia_x/sections/web_view_container.dart';
import 'package:agenzia_x/sections/chiamata_rapida.dart';
import 'package:flutter/material.dart';
import 'package:agenzia_x/firebase_options.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:developer';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:permission_handler/permission_handler.dart';
//import 'package:notification_permissions/notification_permissions.dart';

Future<void> _messageHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  RemoteNotification? notification = message.notification;
  if (notification != null) {}
}

void main() async {
  //WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Permission.notification.isDenied.then((value) {
    if (value) {
      Permission.notification.request();
    }
  });
  var gigi = await Permission.camera.status;
  print(gigi);
  if (await Permission.photos.status == PermissionStatus.denied) {
    Permission.photos.request();
  }
  print(gigi);
  if (await Permission.camera.status == PermissionStatus.denied) {
    Permission.camera.request();
  }

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
  Future getData() async {
    var url = Uri.https('www.seemypage.it', '/hybridandgo/res/api.php',
        {'id': constants.ID, 'token': constants.TOKEN});
    var response = await http.get(url);
    var responseBody = convert.jsonDecode(response.body) as Map;
    print(responseBody); // Remove in production
    return responseBody;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(snapshot.data['nome_app']),
                ],
              ),
            ),
            body: HomePage(data: snapshot.data),
            floatingActionButton: ChiamataRapida(data: snapshot.data),
          );
        } else {
          return Container(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(constants.COLORE_PRINCIPALE),
              ),
            ),
          );
        }
      },
    );
  }
}
