import 'package:agenzia_x/sections/register_form.dart';
import 'package:flutter/material.dart';
import 'package:agenzia_x/sections/account.dart';
import 'package:agenzia_x/sections/login_form.dart';
import 'package:agenzia_x/sections/password_dimenticata.dart';
import 'package:agenzia_x/sections/responses/register_success.dart';
import 'package:agenzia_x/sections/responses/user_already_exists.dart';
import 'package:agenzia_x/sections/responses/codice_agenzia_errato.dart';
import 'package:agenzia_x/sections/responses/general_error.dart';
import 'package:agenzia_x/sections/responses/reset_password.dart';
import 'package:agenzia_x/sections/responses/login_fallito.dart';
import 'package:agenzia_x/sections/responses/utente_non_attivo.dart';
import 'package:agenzia_x/assets/constants.dart' as constants;
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:local_auth/local_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:developer';

class AccountContainer extends StatefulWidget {
  final data;
  const AccountContainer({super.key, required this.data});

  @override
  State<AccountContainer> createState() => _AccountContainerState();
}

class _AccountContainerState extends State<AccountContainer> {
  Future<Map> _sendData() async {
    final LocalAuthentication auth = LocalAuthentication();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final storage = FlutterSecureStorage();
    // inspect(await prefs);
    // await storage.deleteAll();
    // await prefs.remove('gavePermissionToUseBiometrics');
    // await prefs.remove('authenticatedWithBiometrics');
    // await prefs.remove('isLogged');
    // await prefs.remove('notFirstTime');
    // inspect(await prefs);
    // inspect(await storage);
    if (await prefs.containsKey('gavePermissionToUseBiometrics')) {
      if (await prefs.getString('gavePermissionToUseBiometrics') == 'true') {
        var canUseBiometrics = await auth.canCheckBiometrics;
        if (canUseBiometrics) {
          final bool didAuthenticate = await auth.authenticate(
              localizedReason:
                  'Accedi con i tuoi dati biometrici per semplificare il processo di log-in',
              options: const AuthenticationOptions(
                biometricOnly: true,
              ));
          if (didAuthenticate) {
            var url = Uri.https(
              constants.PATH,
              constants.ENDPOINT_LOG,
            );

            var request = {
              'id': constants.ID,
              'token': constants.TOKEN,
              'username': await storage.read(key: 'un'),
              'password': await storage.read(key: 'pw'),
            };

            var response = await http.post(
              url,
              headers: {'Content-Type': 'application/json'},
              body: jsonEncode(request),
            );

            var responseParsed = jsonDecode(response.body) as Map;
            return responseParsed;
          } else {
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
        } else {
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
      } else {
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
    } else {
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
  }

  refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final Future _data = _sendData();

    return FutureBuilder(
      future: _data,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            var isLoggedIn = snapshot.data['http_response_code'];
            switch (isLoggedIn) {
              case '0':
                return LoginForm(data: widget.data, logParent: refresh);
              case '1':
                return AccountPage(
                    data: widget.data,
                    logParent: refresh,
                    dataUtente: snapshot.data);
              case '2':
                return RegisterForm(data: widget.data, logParent: refresh);
              case '3':
                return UserAlreadyExists(data: widget.data, logParent: refresh);
              case '4':
                return CodiceAgenziaErrato(
                    data: widget.data, logParent: refresh);
              case '5':
                return RegisterSuccess(data: widget.data, logParent: refresh);
              case '6':
                return ResetPassword(data: widget.data, logParent: refresh);
              case '97':
                return UtenteNonAttivo(data: widget.data, logParent: refresh);
              case '98':
                return LoginFallito(data: widget.data, logParent: refresh);
              case '99':
                return PasswordDimenticata(
                    data: widget.data, logParent: refresh);
              case '100':
                return GeneralError(data: widget.data, logParent: refresh);
              default:
                return LoginForm(data: widget.data, logParent: refresh);
            }
          } else {
            return LoginForm(data: widget.data, logParent: refresh);
          }
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: CircularProgressIndicator(
                color: constants.COLORE_PRINCIPALE,
              ),
            ),
          );
        } else {
          return GeneralError(data: widget.data, logParent: refresh);
        }
      },
    );
  }
}
