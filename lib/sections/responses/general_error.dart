import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:agenzia_x/assets/constants.dart' as constants;

class GeneralError extends StatefulWidget {
  final data;
  final Function() logParent;
  const GeneralError({super.key, required this.data, required this.logParent});

  @override
  State<GeneralError> createState() => _GeneralErrorState();
}

class _GeneralErrorState extends State<GeneralError> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const HtmlWidget(
            "<h2 style='text-align:center;font-weight:bold;'>ATTENZIONE!</h2><p style='text-align:center;'>Si è verificato un errore. Riprova più tardi.</p>"),
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
