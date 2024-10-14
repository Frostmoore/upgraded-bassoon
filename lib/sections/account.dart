// import 'dart:developer';
// import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
// import 'package:agenzia_x/sections/chiamata_rapida.dart';
// import 'package:webview_flutter/webview_flutter.dart';
// import 'package:intl/intl.dart';import 'package:agenzia_x/assets/constants.dart' as constants;
// import 'package:http/http.dart' as http;
// import 'dart:convert' as convert;
//import 'package:notification_permissions/notification_permissions.dart';
import 'package:local_auth/local_auth.dart';
// import 'dart:developer';
import 'package:agenzia_x/sections/account/account_header.dart';
import 'package:agenzia_x/sections/account/account_polizze.dart';
import 'package:agenzia_x/assets/constants.dart' as constants;
// import 'package:http/http.dart' as http;
// import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
// import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AccountPage extends StatefulWidget {
  final data;
  final dataUtente;
  final Function() logParent;
  const AccountPage(
      {super.key,
      required this.data,
      required this.logParent,
      required this.dataUtente});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final LocalAuthentication auth = LocalAuthentication();

  Future _askPermissionToAuthenticate() async {
    bool _canUseBiometrics = await auth.canCheckBiometrics;
    final storage = FlutterSecureStorage();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // print(await storage.read(key: 'username'));
    // print(await storage.read(key: 'un'));
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (_canUseBiometrics) {
        if (!prefs.containsKey('authenticatedWithBiometrics')) {
          if (!prefs.containsKey('gavePermissionToUseBiometrics')) {
            showDialog(
              context: context,
              builder: (context) {
                return Theme(
                  data: Theme.of(context)
                      .copyWith(dialogBackgroundColor: Colors.white),
                  child: AlertDialog(
                    backgroundColor: Colors.white,
                    surfaceTintColor: Colors.white,
                    title: const Text(
                      'Autenticazione Biometrica',
                      textAlign: TextAlign.center,
                    ),
                    content: const HtmlWidget(
                      '<p style="text-align:center;">Vuoi consentire a questa app di autenticarti tramite <strong>impronta digitale</strong> o <strong>riconoscimento facciale</strong> per semplificare il procedimento di log-in?<br>I tuoi dati non verranno <strong>mai trasmessi</strong> fuori dal tuo dispositivo.</p>',
                    ),
                    actions: [
                      ElevatedButton(
                        style: constants.STILE_BOTTONE,
                        onPressed: () async {
                          await storage.delete(key: 'username');
                          await storage.delete(key: 'password');
                          prefs.setString(
                              'gavePermissionToUseBiometrics', 'false');
                          Navigator.of(context).pop();
                        },
                        child: const Text('NO (Non mostrare più)'),
                      ),
                      ElevatedButton(
                        style: constants.STILE_BOTTONE,
                        onPressed: () async {
                          var un = await storage.read(key: 'username');
                          var pw = await storage.read(key: 'password');
                          await storage.write(key: 'un', value: un);
                          await storage.write(key: 'pw', value: pw);
                          await storage.delete(key: 'username');
                          await storage.delete(key: 'password');
                          final bool didAuthenticate = await auth.authenticate(
                              localizedReason:
                                  'Accedi con i tuoi dati biometrici per semplificare il processo di log-in',
                              options: const AuthenticationOptions(
                                  biometricOnly: true));
                          if (didAuthenticate) {
                            prefs.setString(
                                'authenticatedWithBiometrics', 'true');
                          }
                          prefs.setString(
                              'gavePermissionToUseBiometrics', 'true');
                          Navigator.of(context).pop();
                        },
                        child: const Text('SI (Autenticati)'),
                      ),
                    ],
                  ),
                );
              },
            );
          } else {}
        } else {}
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var gigi = _askPermissionToAuthenticate();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            constants.SPACER,
            AccountHeader(data: widget.data, userData: widget.dataUtente),
            constants.SPACER_MEDIUM,
            AccountPolizze(data: widget.data, userData: widget.dataUtente),
            constants.SPACER,
            ElevatedButton(
              style: constants.STILE_BOTTONE,
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                FlutterSecureStorage storage = const FlutterSecureStorage();
                // print(await prefs.getString('gavePermissionToUseBiometrics'));
                if (await prefs.containsKey('gavePermissionToUseBiometrics')) {
                  await prefs.remove('authenticatedWithBiometrics');
                  await prefs.remove('gavePermissionToUseBiometrics');
                  await storage.deleteAll();
                }
                constants.isLoggedIn = 0;
                widget.logParent();
              },
              child: Text('Cancella i tuoi dati'),
            )
          ],
        ),
      ),
    );
  }
}
