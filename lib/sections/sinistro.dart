import 'package:flutter/material.dart';
import 'package:agenzia_x/assets/constants.dart' as constants;

class Sinistro extends StatefulWidget {
  final data;
  const Sinistro({super.key, required this.data});

  @override
  State<Sinistro> createState() => _SinistroState();
}

class _SinistroState extends State<Sinistro> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(
            width: width - 16,
            height: 70,
            child: const DecoratedBox(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: constants.IMAGE_CRASH,
                  fit: BoxFit.contain,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(8, 18, 8, 8),
                child: Text(
                  constants.TITOLO_SEZIONE_DENUNCIA,
                  style: constants.H1,
                ),
              ),
            ),
          ),
          constants.SPACER,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Text(
                  constants.SINISTRO_EVIDENZA,
                  textAlign: TextAlign.center,
                  style: constants.EVIDENZA,
                ),
                constants.SPACER,
                const Text(
                  constants.SINISTRO_TEXT,
                  textAlign: TextAlign.center,
                ),
                constants.SPACER,
                SizedBox(
                  width: width,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/webViewContainer');
                    },
                    label: const Text(constants.SINISTRO_TESTO_BOTTONE),
                    style: constants.STILE_BOTTONE,
                    icon: const Icon(Icons.web),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
