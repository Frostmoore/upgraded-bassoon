import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:agenzia_x/assets/constants.dart' as constants;

class ResetPassword extends StatefulWidget {
  final data;
  final Function() logParent;
  const ResetPassword({super.key, required this.data, required this.logParent});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const HtmlWidget(
            "<h2 style='text-align:center;font-weight:bold;'>Hai chiesto la reimpostazione della tua Password!</h2>"),
        constants.SPACER_MEDIUM,
        const HtmlWidget(
            "<p style='text-align:center;'>Ti abbiamo inviato un'email con il link per la reimpostazione.<br>Controlla anche nella casella di Posta Indesiderata.</p>"),
        constants.SPACER_MEDIUM,
        ElevatedButton(
          style: constants.STILE_BOTTONE,
          onPressed: () {
            constants.isLoggedIn = 0;
            widget.logParent();
          },
          child: const Text("HO CAPITO"),
        ),
      ],
    );
  }
}
