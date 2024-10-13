import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class AccountHeader extends StatefulWidget {
  final data;
  final userData;

  const AccountHeader({super.key, required this.data, required this.userData});

  @override
  State<AccountHeader> createState() => _AccountHeaderState();
}

class _AccountHeaderState extends State<AccountHeader> {
  @override
  Widget build(BuildContext context) {
    print(widget.userData);
    var nome = widget.userData['result']['nome'];
    String? saluto =
        '<p style="text-align:center">Ciao, <strong>$nome</strong>!<br>Qui potrai controllare lo stato delle tue polizze e verificarne la data di scadenza.</p>';
    return Column(
      children: [
        const Text(
          "LE MIE POLIZZE",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        HtmlWidget(saluto),
      ],
    );
  }
}
