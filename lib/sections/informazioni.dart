import 'package:flutter/material.dart';
import 'package:agenzia_x/assets/constants.dart' as constants;

class InformazioniAgenzie extends StatefulWidget {
  final data;

  const InformazioniAgenzie({super.key, required this.data});

  @override
  State<InformazioniAgenzie> createState() => _InformazioniAgenzieState();
}

class _InformazioniAgenzieState extends State<InformazioniAgenzie> {
  @override
  Widget build(BuildContext context) {
    Map arrayNomi = constants.SEDI_NOMI_ARRAY.asMap();
    return Column(
      children: [
        for (var index in arrayNomi.keys)
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black38),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                            constants.SEDI_LOGO_ARRAY[index].toString(),
                          ),
                          radius: 35,
                        ),
                      ],
                    ),
                    Text(
                      arrayNomi[index],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    Text(
                      constants.SEDI_INDIRIZZI_ARRAY[index],
                      textAlign: TextAlign.center,
                    ),
                    constants.SPACER,
                    Text(
                      widget.data['nome_agenzia'], // COPIARE QUI
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      constants.SEDI_ORARI_ARRAY[index],
                      textAlign: TextAlign.center,
                    ),
                    constants.SPACER,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.phone),
                          onPressed: () => constants
                              .openUrl(constants.SEDI_TELEFONO_ARRAY[index]),
                          style: const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                                constants.COLORE_TERZIARIO),
                            foregroundColor:
                                MaterialStatePropertyAll(Colors.white),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.email),
                          onPressed: () => constants
                              .openUrl(constants.SEDI_EMAIL_ARRAY[index]),
                          style: const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                                constants.COLORE_TERZIARIO),
                            foregroundColor:
                                MaterialStatePropertyAll(Colors.white),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.pin_drop),
                          onPressed: () => constants
                              .openUrl(constants.SEDI_MAPS_ARRAY[index]),
                          style: const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                                constants.COLORE_TERZIARIO),
                            foregroundColor:
                                MaterialStatePropertyAll(Colors.white),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.language),
                          onPressed: () => constants
                              .openUrl(constants.SEDI_SITO_ARRAY[index]),
                          style: const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                                constants.COLORE_TERZIARIO),
                            foregroundColor:
                                MaterialStatePropertyAll(Colors.white),
                          ),
                        ),
                      ],
                    ),
                    constants.SPACER_MEDIUM,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () => constants
                              .openUrl(constants.SEDI_RECENSIONI_ARRAY[index]),
                          icon: const Icon(Icons.reviews),
                          label: const Text(
                            'Lasciaci una Recensione!',
                            textAlign: TextAlign.center,
                          ),
                          style: ButtonStyle(
                            backgroundColor: const MaterialStatePropertyAll(
                                constants.COLORE_TERZIARIO),
                            foregroundColor:
                                const MaterialStatePropertyAll(Colors.white),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5))),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
      ],
    );

    //arrayNomi[indice]

    /*return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black38),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: Material(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          elevation: 5,
          child: InkWell(
            radius: 100,
            onTap: () => constants.openUrl(constants.LINK_SEDE_UNO),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CircleAvatar(
                          backgroundImage: constants.IMMAGINE_SEDE,
                          radius: 35,
                        ),
                        constants.SPACER_MEDIUM,
                        const Text(
                          constants.NOME_SEDE_UNO,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          constants.INDIRIZZO_SEDE_UNO,
                          textAlign: TextAlign.center,
                        ),
                        constants.SPACER,
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Orari di Apertura',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const Text(
                          constants.ORARI_SEDE_UNO,
                          textAlign: TextAlign.center,
                        ),
                        constants.SPACER,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () =>
                                  constants.openUrl(constants.MAPPA_LINK),
                              icon: const Icon(Icons.pin_drop),
                              style: const ButtonStyle(
                                foregroundColor:
                                    MaterialStatePropertyAll(Colors.white),
                                backgroundColor: MaterialStatePropertyAll(
                                    constants.COLORE_SECONDARIO),
                              ),
                            ),
                            IconButton(
                              onPressed: () =>
                                  constants.openUrl(constants.MAPPA_LINK),
                              icon: const Icon(Icons.phone),
                              style: const ButtonStyle(
                                foregroundColor:
                                    MaterialStatePropertyAll(Colors.white),
                                backgroundColor: MaterialStatePropertyAll(
                                    constants.COLORE_SECONDARIO),
                              ),
                            ),
                            IconButton(
                              onPressed: () =>
                                  constants.openUrl(constants.MAPPA_LINK),
                              icon: const Icon(Icons.email),
                              style: const ButtonStyle(
                                foregroundColor:
                                    MaterialStatePropertyAll(Colors.white),
                                backgroundColor: MaterialStatePropertyAll(
                                    constants.COLORE_SECONDARIO),
                              ),
                            ),
                            IconButton(
                              onPressed: () =>
                                  constants.openUrl(constants.MAPPA_LINK),
                              icon: const Icon(Icons.language),
                              style: const ButtonStyle(
                                foregroundColor:
                                    MaterialStatePropertyAll(Colors.white),
                                backgroundColor: MaterialStatePropertyAll(
                                    constants.COLORE_SECONDARIO),
                              ),
                            ),
                          ],
                        ),
                        constants.SPACER,
                        ElevatedButton.icon(
                          onPressed: () =>
                              constants.openUrl(constants.RECENSIONE_SEDE_UNO),
                          icon: const Icon(Icons.reviews),
                          label: const Text('Lasciaci una Recensione'),
                          style: constants.STILE_BOTTONE,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );*/
  }
}
