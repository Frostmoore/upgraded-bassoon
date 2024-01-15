import 'package:flutter/material.dart';
import 'package:agenzia_x/assets/constants.dart' as constants;
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChiamataRapida extends StatefulWidget {
  final data;
  const ChiamataRapida({super.key, required this.data});

  @override
  State<ChiamataRapida> createState() => _ChiamataRapidaState();
}

class _ChiamataRapidaState extends State<ChiamataRapida> {
  @override
  Widget build(BuildContext context) {
    var quick_telefono = widget.data['quick_telefono'];
    var quick_email = widget.data['quick_email'];
    var quick_whatsapp = widget.data['quick_whatsapp'];

    return SpeedDial(
      icon: Icons.phone,
      backgroundColor: constants.COLORE_PRINCIPALE,
      children: [
        SpeedDialChild(
          child: const Icon(Icons.phone_android_outlined),
          foregroundColor: Colors.white,
          backgroundColor: constants.COLORE_PRINCIPALE,
          label: constants.CHIAMATA_RAPIDA_UNO,
          shape: const CircleBorder(eccentricity: 0),
          onTap: () => constants.openUrl(Uri.parse('tel:' + quick_telefono)),
        ),
        SpeedDialChild(
          child: Padding(
            padding: const EdgeInsets.all(9.0),
            child: SvgPicture.asset(
              'lib/assets/whatsapp.svg',
              color: Colors.white,
            ),
          ),
          foregroundColor: Colors.white,
          backgroundColor: constants.COLORE_PRINCIPALE,
          label: constants.CHIAMATA_RAPIDA_DUE,
          shape: const CircleBorder(eccentricity: 0),
          onTap: () => constants.openUrl(Uri.parse(quick_whatsapp)),
        ),
        SpeedDialChild(
          child: const Icon(Icons.email),
          foregroundColor: Colors.white,
          backgroundColor: constants.COLORE_PRINCIPALE,
          label: constants.CHIAMATA_RAPIDA_TRE,
          shape: const CircleBorder(eccentricity: 0),
          onTap: () => constants.openUrl(Uri.parse('mailto:' + quick_email)),
        ),
      ],
    );
  }
}
