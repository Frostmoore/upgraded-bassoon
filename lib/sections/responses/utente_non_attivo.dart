import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:agenzia_x/assets/constants.dart' as constants;

class UtenteNonAttivo extends StatefulWidget {
  final data;
  final Function() logParent;
  const UtenteNonAttivo(
      {super.key, required this.data, required this.logParent});

  @override
  State<UtenteNonAttivo> createState() => _UtenteNonAttivoState();
}

class _UtenteNonAttivoState extends State<UtenteNonAttivo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const HtmlWidget(
            "<h2 style='text-align:center;font-weight:bold;'>ATTENZIONE!</h2><p style='text-align:center;'>Attiva il tuo account per poter utilizzare le funzioni avanzate dell'app.<br>In fase di registrazione, ti è stata inviata un'e-mail con il link di attivazione.<br>Se non hai ricevuto l'email, assicurati di controllare anche nella casella di Posta Indesiderata, o contatta la tua Agenzia.</p>"),
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
