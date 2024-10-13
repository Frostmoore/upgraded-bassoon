import 'dart:developer';

import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';
// import 'package:agenzia_x/sections/chiamata_rapida.dart';
// import 'package:webview_flutter/webview_flutter.dart';
// import 'package:intl/intl.dart';import 'package:agenzia_x/assets/constants.dart' as constants;
// import 'package:http/http.dart' as http;
// import 'dart:convert' as convert;
//import 'package:notification_permissions/notification_permissions.dart';
// import 'package:local_auth/local_auth.dart';
// import 'dart:developer';
import 'package:agenzia_x/sections/account/account_header.dart';
import 'package:agenzia_x/sections/account/account_polizze.dart';
import 'package:agenzia_x/assets/constants.dart' as constants;
import 'package:http/http.dart' as http;
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'dart:convert';
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
  Future<Map> _sendData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final storage = FlutterSecureStorage();

    var url = Uri.https(
      constants.PATH,
      constants.ENDPOINT_LOG,
    );
    var request = {
      'id': constants.ID,
      'token': constants.TOKEN,
      'username': await storage.read(key: 'username'),
      'password': await storage.read(key: 'password'),
    };
    var response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(request),
    );
    var responseParsed = jsonDecode(response.body) as Map;
    return responseParsed;
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var nome = widget.dataUtente['result']['nome'];
    var saluto =
        "<p style='text-align:center;'>Ciao, <strong>$nome!</strong><br>Qui potrai controllare le tue polizze, verificarne la data di scadenza e leggerne i dettagli più importanti.</p>";
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
              onPressed: () {
                constants.isLoggedIn = 0;
                widget.logParent();
              },
              child: Text('ciao'),
            )
          ],
        ),
      ),
    );
  }
}
