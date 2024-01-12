import 'package:flutter/material.dart';
import 'package:agenzia_x/assets/constants.dart' as constants;
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChiamataRapida extends StatefulWidget {
  const ChiamataRapida({super.key});

  @override
  State<ChiamataRapida> createState() => _ChiamataRapidaState();
}

class _ChiamataRapidaState extends State<ChiamataRapida> {
  @override
  Widget build(BuildContext context) {
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
          onTap: () => constants.openUrl(constants.LINK_CHIAMATA_RAPIDA_UNO),
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
          onTap: () => constants.openUrl(constants.LINK_CHIAMATA_RAPIDA_DUE),
        ),
        SpeedDialChild(
          child: const Icon(Icons.email),
          foregroundColor: Colors.white,
          backgroundColor: constants.COLORE_PRINCIPALE,
          label: constants.CHIAMATA_RAPIDA_TRE,
          shape: const CircleBorder(eccentricity: 0),
          onTap: () => constants.openUrl(constants.LINK_CHIAMATA_RAPIDA_TRE),
        ),
      ],
    );
  }
}
