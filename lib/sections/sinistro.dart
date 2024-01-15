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
    var denuncia_immagine_dirty = widget.data['denuncia_immagine'];
    var denuncia_immagine =
        constants.IMG_PATH + denuncia_immagine_dirty.replaceAll('\\', '/');
    var denuncia_titolo = widget.data['denuncia_titolo'];
    var denuncia_testo_grassetto = widget.data['denuncia_testo_grassetto'];
    var denuncia_testo = widget.data['denuncia_testo'];
    var baseAddr =
        'https://www.seemypage.it/hybridandgo/denuncia_sinistro.php?id=';
    var id = constants.ID;
    var token = '&token=' + constants.TOKEN;
    var todo = baseAddr + id + token;
    var url_denuncia = Uri.parse(todo);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(
            width: width - 16,
            height: 70,
            child: DecoratedBox(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(denuncia_immagine),
                  fit: BoxFit.contain,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(8, 18, 8, 8),
                child: Text(
                  denuncia_titolo,
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
                Text(
                  denuncia_testo_grassetto,
                  textAlign: TextAlign.center,
                  style: constants.EVIDENZA,
                ),
                constants.SPACER,
                Text(
                  denuncia_testo,
                  textAlign: TextAlign.center,
                ),
                constants.SPACER,
                SizedBox(
                  width: width,
                  child: ElevatedButton.icon(
                    onPressed: () => constants.openUrl(url_denuncia),
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
