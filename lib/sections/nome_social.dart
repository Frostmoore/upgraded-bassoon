import 'package:flutter/material.dart';
import 'package:agenzia_x/assets/constants.dart' as constants;

class NomeSocial extends StatefulWidget {
  const NomeSocial({super.key});

  @override
  State<NomeSocial> createState() => _NomeSocialState();
}

class _NomeSocialState extends State<NomeSocial> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const Text(
            constants.NOME_AGENZIA,
            textAlign: TextAlign.center,
            style: constants.H1,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () => constants.openUrl(constants.FACEBOOK_LINK),
                  icon: constants.IMAGE_FACEBOOK,
                ),
                IconButton(
                  onPressed: () => constants.openUrl(constants.INSTAGRAM_LINK),
                  icon: constants.IMAGE_INSTAGRAM,
                ),
                IconButton(
                  onPressed: () => constants.openUrl(constants.LINKEDIN_LINK),
                  icon: constants.IMAGE_LINKEDIN,
                ),
                IconButton(
                  onPressed: () => constants.openUrl(constants.GOOGLE_LINK),
                  icon: constants.IMAGE_GOOGLE,
                ),
                IconButton(
                  onPressed: () => constants.openUrl(constants.SITO_LINK),
                  icon: constants.IMAGE_WEBSITE,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
