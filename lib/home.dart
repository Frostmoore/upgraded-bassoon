import 'package:flutter/material.dart';
//import 'package:agenzia_x/sections/cai.dart';
import 'package:agenzia_x/sections/contatti.dart';
import 'package:agenzia_x/sections/info.dart';
import 'package:agenzia_x/sections/nome_social.dart';
import 'package:agenzia_x/sections/sinistro.dart';
import 'package:agenzia_x/sections/header.dart';
import 'package:agenzia_x/assets/constants.dart' as constants;

class HomePage extends StatefulWidget {
  final data;
  const HomePage({super.key, required this.data});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Header(),
          constants.SPACER,
          NomeSocial(),
          Info(data: widget.data),
          constants.SPACER,
          Contatti(),
          constants.SPACER,
          Sinistro(),
          constants.SPACER,
          constants.SPACER,
          constants.SPACER,
          /*Cai(),*/
        ],
      ),
    );
  }
}
