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
    var numeriUtiliLabels = widget.data['numeri_utili_labels'].split('|');
    var numeriUtiliColori = widget.data['numeri_utili_colori'].split('|');
    var numeriUtiliLinks = widget.data['numeri_utili_link'].split('|');

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
              padding: const EdgeInsets.fromLTRB(8, 18, 8, 8),
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
                  const Text(
                    'Numeri Utili:',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              if (numeriUtiliLinks[0] != '')
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () =>
                            constants.openUrl(Uri.parse(numeriUtiliLinks[0])),
                        icon: const Icon(Icons.monitor_heart),
                        label: Text(numeriUtiliLabels[0]),
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Color(
                              int.parse(numeriUtiliColori[0]),
                            ),
                          ),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              const SizedBox(height: 25),
              if (numeriUtiliLinks[1] != '')
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //const SizedBox(width: 30),
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () =>
                            constants.openUrl(Uri.parse(numeriUtiliLinks[1])),
                        icon: const Icon(Icons.taxi_alert),
                        label: Text(numeriUtiliLabels[1]),
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Color(
                              int.parse(numeriUtiliColori[1]),
                            ),
                          ),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              const SizedBox(height: 25),
              if (numeriUtiliLinks[2] != '')
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () =>
                            constants.openUrl(Uri.parse(numeriUtiliLinks[2])),
                        icon: const Icon(Icons.directions_car),
                        label: Text(numeriUtiliLabels[2]),
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Color(
                              int.parse(numeriUtiliColori[2]),
                            ),
                          ),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                        ),
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
