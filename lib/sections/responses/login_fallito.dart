import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:agenzia_x/assets/constants.dart' as constants;

class LoginFallito extends StatefulWidget {
  final data;
  final Function() logParent;
  const LoginFallito({super.key, required this.data, required this.logParent});

  @override
  State<LoginFallito> createState() => _LoginFallitoState();
}

class _LoginFallitoState extends State<LoginFallito> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const HtmlWidget(
            "<h2 style='text-align:center;font-weight:bold;'>ATTENZIONE!</h2><p style='text-align:center;'>Non siamo riusciti a farti accedere. Riprova più tardi, contatta la tua agenzia o, se credi di aver dimenticato la password, clicca sul link seguente per reimpostarla.</p>"),
        InkWell(
          onTap: () {
            constants.isLoggedIn = 99;
            widget.logParent();
          },
          child: const HtmlWidget(
              "<p style='text-align:center;text-decoration:underline;color:blue;'>Password Dimenticata?</p>"),
        ),
        constants.SPACER_MEDIUM,
        ElevatedButton(
          style: constants.STILE_BOTTONE,
          onPressed: () {
            constants.isLoggedIn = 0;
            widget.logParent();
          },
          child: const Text("INDIETRO"),
        ),
      ],
    );
  }
}
