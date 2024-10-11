// import 'package:accordion/accordion.dart';
import 'package:agenzia_x/sections/register_form.dart';
import 'package:flutter/material.dart';
// import 'package:agenzia_x/sections/chiamata_rapida.dart';
// import 'package:webview_flutter/webview_flutter.dart';
// import 'package:intl/intl.dart';import 'package:agenzia_x/assets/constants.dart' as constants;
// import 'package:http/http.dart' as http;
// import 'dart:convert' as convert;
//import 'package:notification_permissions/notification_permissions.dart';
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
// import 'package:agenzia_x/sections/password_dimenticata.dart';
import 'package:agenzia_x/assets/constants.dart' as constants;

class AccountContainer extends StatefulWidget {
  final data;
  const AccountContainer({super.key, required this.data});

  @override
  State<AccountContainer> createState() => _AccountContainerState();
}

class _AccountContainerState extends State<AccountContainer> {
  refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var isLoggedIn = constants.isLoggedIn;
    var dataUtente = constants.dataUtente;

    switch (isLoggedIn) {
      case 0:
        return LoginForm(data: widget.data, logParent: refresh);
      case 1:
        return AccountPage(
            data: widget.data, logParent: refresh, dataUtente: dataUtente);
      case 2:
        return RegisterForm(data: widget.data, logParent: refresh);
      case 3:
        return UserAlreadyExists(data: widget.data, logParent: refresh);
      case 4:
        return CodiceAgenziaErrato(data: widget.data, logParent: refresh);
      case 5:
        return RegisterSuccess(data: widget.data, logParent: refresh);
      case 6:
        return ResetPassword(data: widget.data, logParent: refresh);
      case 97:
        return UtenteNonAttivo(data: widget.data, logParent: refresh);
      case 98:
        return LoginFallito(data: widget.data, logParent: refresh);
      case 99:
        return PasswordDimenticata(data: widget.data, logParent: refresh);
      case 100:
        return GeneralError(data: widget.data, logParent: refresh);
      default:
        return LoginForm(data: widget.data, logParent: refresh);
    }
  }
}
