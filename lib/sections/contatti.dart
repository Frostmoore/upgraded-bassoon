import 'package:flutter/material.dart';
import 'package:agenzia_x/assets/constants.dart' as constants;

class Contatti extends StatefulWidget {
  final data;
  const Contatti({super.key, required this.data});

  @override
  State<Contatti> createState() => _ContattiState();
}

class _ContattiState extends State<Contatti> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var contatti_immagine_dirty = widget.data['contatti_immagine'];
    var contatti_immagine =
        constants.IMG_PATH + contatti_immagine_dirty.replaceAll('\\', '/');
    var contatti_titolo = widget.data['contatti_titolo'];
    var contatti_testo = widget.data['contatti_testo'];

    return Column(
      children: [
        SizedBox(
          width: width - 16,
          height: 70,
          child: DecoratedBox(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(contatti_immagine),
                fit: BoxFit.contain,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(8, 18, 8, 8),
              child: Text(
                contatti_titolo,
                textAlign: TextAlign.start,
                style: constants.H1,
              ),
            ),
          ),
        ),
        constants.SPACER,
        Padding(
          padding: const EdgeInsets.fromLTRB(18.0, 0, 18, 0),
          child: Column(
            children: [
              Column(
                children: [
                  const Text(
                    'Contatti:',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    contatti_testo,
                    textAlign: TextAlign.center,
                  ),
                  constants.SPACER,
                  Text(
                    'Numeri Utili:',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () => constants.openUrl(constants.EMAIL_LINK),
                      icon: const Icon(Icons.monitor_heart),
                      label: const Text('Salute'),
                      style: constants.STILE_BOTTONE,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //const SizedBox(width: 30),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () => constants.openUrl(constants.SITO_LINK),
                      icon: const Icon(Icons.taxi_alert),
                      label: const Text('Assistenza Stradale'),
                      style: constants.STILE_BOTTONE,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () => constants.openUrl(constants.MAPPA_LINK),
                      icon: const Icon(Icons.directions_car),
                      label: const Text('Noleggio'),
                      style: constants.STILE_BOTTONE,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
