import 'package:agenzia_x/sections/informazioni.dart';
import 'package:agenzia_x/sections/notifica.dart';
import 'package:flutter/material.dart';
import 'package:agenzia_x/assets/constants.dart' as constants;
import 'package:accordion/accordion.dart';

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
    var info_titolo = widget.data['info_titolo'];
    var info_immagine_dirty = widget.data['info_immagine'];
    var info_immagine =
        constants.IMG_PATH + info_immagine_dirty.replaceAll('\\', '/');
    /*final PageController _controller = PageController(viewportFraction: 0.8);*/

    //return InformazioniAgenzie();

    return Column(
      children: [
        constants.SPACER,
        if (widget.data['notifica_testo'] != '') Notifica(data: widget.data),
        Accordion(
          headerBorderWidth: 1,
          headerBorderColor: Colors.transparent,
          headerBorderColorOpened: Colors.transparent,
          headerBackgroundColor: Colors.transparent,
          headerBackgroundColorOpened: Colors.transparent,
          contentBorderColor: Colors.transparent,
          contentBackgroundColor: Colors.transparent,
          contentHorizontalPadding: 0,
          disableScrolling: true,
          headerPadding: const EdgeInsets.all(0),
          children: [
            AccordionSection(
              rightIcon: const Icon(
                Icons.arrow_drop_down_rounded,
                size: 45,
              ),
              header: SizedBox(
                width: width - 16,
                height: 70,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(info_immagine),
                      fit: BoxFit.contain,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8, 18, 8, 8),
                    child: Text(
                      info_titolo,
                      textAlign: TextAlign.start,
                      style: constants.H1,
                    ),
                  ),
                ),
              ),
              content: InformazioniAgenzie(data: widget.data),
            ),
          ],
        ),
      ],
    );
  }
}
