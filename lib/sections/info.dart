import 'package:agenzia_x/sections/informazioni.dart';
import 'package:agenzia_x/sections/notifica.dart';
import 'package:flutter/material.dart';
import 'package:agenzia_x/assets/constants.dart' as constants;

class Info extends StatefulWidget {
  final data;
  const Info({super.key, required this.data});

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    /*final PageController _controller = PageController(viewportFraction: 0.8);*/

    //return InformazioniAgenzie();

    return Column(
      children: [
        SizedBox(
          width: width - 16,
          height: 70,
          child: const DecoratedBox(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: constants.IMAGE_INFO,
                fit: BoxFit.contain,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(8, 18, 8, 8),
              child: Text(
                constants.TITOLO_SEZIONE_INFO,
                textAlign: TextAlign.start,
                style: constants.H1,
              ),
            ),
          ),
        ),
        constants.SPACER,
        if (constants.NOTIFICA_TEXT != '') Notifica(data: widget.data),
        constants.SPACER,
        InformazioniAgenzie(data: widget.data),
      ],
    );

    /*return Column(
      children: [
        SizedBox(
          width: width - 16,
          height: 70,
          child: const DecoratedBox(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: constants.IMAGE_INFO,
                fit: BoxFit.contain,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(8, 18, 8, 8),
              child: Text(
                constants.TITOLO_SEZIONE_INFO,
                textAlign: TextAlign.start,
                style: constants.H1,
              ),
            ),
          ),
        ),
        constants.SPACER,
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            constants.NOTIFICA,
            constants.SPACER,
            const Text(
              constants.EVIDENZA_ORARI,
              textAlign: TextAlign.center,
              style: constants.EVIDENZA,
            ),
            const SizedBox(height: 10),
            const Text(
              'Sede1',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'Lunedì-Venerdì: 9:30 - 12:30 e 15:30 - 18:30\nSabato: 9:30 - 12:30',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            const Text(
              'Sede2',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'Lunedì-Venerdì: 9:30 - 12:30 e 15:30 - 18:30\nSabato: 9:30 - 12:30',
              textAlign: TextAlign.center,
            ),
            constants.SPACER,
            const Text(
              constants.EVIDENZA_INDIRIZZI,
              textAlign: TextAlign.center,
              style: constants.EVIDENZA,
            ),
            const SizedBox(height: 10),
            const Text(
              'Sede1',
              style: constants.BOLD,
            ),
            const Text(
              'Via dell\'acquedotto, 24 - 01036 Nepi (VT)',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            const Text(
              'Sede2',
              style: constants.BOLD,
            ),
            const Text(
              'Via di S. Maria Maggiore, 32 - 00123 Roma (RM)',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () => constants.openUrl(constants.MAPPA_LINK),
              icon: const Icon(Icons.map),
              label: const Text(constants.TESTO_BOTTONE_GOOGLE_MAPS),
              style: constants.STILE_BOTTONE,
            ),
            constants.SPACER,
            const Text(
              constants.TESTO_CONTATTI_TELEFONICI,
              textAlign: TextAlign.center,
              style: constants.EVIDENZA,
            ),
            const SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Sede1',
                  style: constants.BOLD,
                ),
                ElevatedButton.icon(
                  onPressed: () => constants.openUrl(constants.TELEFONO_LINK),
                  icon: const Icon(Icons.phone),
                  label: const Text('Mario Giovannetti'),
                  style: constants.STILE_BOTTONE,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Sede2',
                  style: constants.BOLD,
                ),
                ElevatedButton.icon(
                  onPressed: () => constants.openUrl(constants.TELEFONO_LINK),
                  icon: const Icon(Icons.phone),
                  label: const Text('Francesco Celozzi'),
                  style: constants.STILE_BOTTONE,
                ),
                const SizedBox(height: 10),
              ],
            ),
          ],
        ),
      ],
    );*/
  }
}
