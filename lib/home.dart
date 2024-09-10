// import 'package:agenzia_x/sections/indirizzo.dart';
import 'package:agenzia_x/sections/preventivo.dart';
import 'package:agenzia_x/sections/documento.dart';
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
          Header(data: widget.data),
          constants.SPACER,
          NomeSocial(data: widget.data),
          Info(data: widget.data),
          //constants.SPACER,
          Contatti(data: widget.data),
          //constants.SPACER,
          Sinistro(data: widget.data),
          Preventivo(data: widget.data),
          Documento(data: widget.data),
          constants.SPACER,
          constants.SPACER,
          /*Cai(),*/
        ],
      ),
    );
  }
}
