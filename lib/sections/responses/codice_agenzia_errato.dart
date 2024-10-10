import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:agenzia_x/assets/constants.dart' as constants;

class CodiceAgenziaErrato extends StatefulWidget {
  final data;
  final Function() logParent;
  const CodiceAgenziaErrato(
      {super.key, required this.data, required this.logParent});

  @override
  State<CodiceAgenziaErrato> createState() => _CodiceAgenziaErratoState();
}

class _CodiceAgenziaErratoState extends State<CodiceAgenziaErrato> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Column(
            children: [
              const HtmlWidget(
                  "<h2 style='text-align:center;font-weight:bold;'>ATTENZIONE!</h2><p style='text-align:center;'>Il Codice Agenzia che hai inserito non risulta corretto.</p><p>Contatta la tua Agenzia per riceverne uno valido.</p>"),
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
          ),
        ],
      ),
    );
  }
}
