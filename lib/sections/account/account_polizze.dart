import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:developer';
import 'package:agenzia_x/assets/constants.dart' as constants;

class AccountPolizze extends StatefulWidget {
  final data;
  final userData;
  const AccountPolizze({super.key, required this.data, required this.userData});

  @override
  State<AccountPolizze> createState() => _AccountPolizzeState();
}

class _AccountPolizzeState extends State<AccountPolizze> {
  Future _getPolizze() async {
    //
    var data = widget.data;
    var user = widget.userData;

    // AssiEasy Data
    var usernameAe = user['result']['email'];
    var passwordAe = user['result']['activation_token'];
    var headersAeLogin = {
      'chiave-hi': constants.chiaveHi,
      'Accept': '*/*',
      'Cache-Control': 'no-cache',
      'Host': 'demo.assieasy.com',
      'Accept-Encoding': 'gzip, deflate, br',
      'Connection': 'keep-alive',
    };

    // AssiEasy Request Login
    var loginRequestAe = {
      'username': usernameAe,
      'email': usernameAe,
      'password': passwordAe,
    };
    // print(headersAeLogin);
    // print(loginRequestAe);
    var loginAe = await http.post(
      constants.urlAssiEasyLogin,
      headers: headersAeLogin,
      body: loginRequestAe,
    );
    var loginAeParsed = jsonDecode(loginAe.body) as Map;
    var tokenAe = loginAeParsed['data']['TOKEN'] as String;
    var refreshTokenAe = loginAeParsed['data']['REFRESH_TOKEN'];

    // AssiEasy Request Polizze
    var headersAePolizze = {
      'chiave-hi': constants.chiaveHi,
      'Accept': '*/*',
      'Cache-Control': 'no-cache',
      'Host': 'demo.assieasy.com',
      'Accept-Encoding': 'gzip, deflate, br',
      'Connection': 'keep-alive',
      'token': tokenAe,
    };
    var polizzeRequestAe = {
      'ID_POLIZZA': '0',
      'SOLO_VIVE': '1',
      'sorts[1][column]': 'NUMERO_POLIZZA',
      'sorts[1][order]': 'DESC',
    };
    var polizzeAe = await http.post(
      constants.urlAssiEasyPolizze,
      headers: headersAePolizze,
      body: polizzeRequestAe,
    );
    var polizzeAeParsed = jsonDecode(polizzeAe.body) as Map;
    // inspect(polizzeAeParsed);
    return polizzeAeParsed;
  }

  @override
  Widget build(BuildContext context) {
    final Future _polizze = _getPolizze();
    return FutureBuilder(
      future: _polizze,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          // inspect(snapshot.data);
          if (snapshot.hasData) {
            print(snapshot.data['data']);
            print(snapshot.data['data'][0]['ID_POLIZZA']);
            print(snapshot.data['totalCount']);
            return Column(
              children: [
                for (var i = 0; i < snapshot.data['totalCount']; i++)
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black45),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Text("Compagnia: " +
                              snapshot.data['data'][i]['DESC_COMPAGNIA']),
                          Text("Numero Polizza: " +
                              snapshot.data['data'][i]['ID_POLIZZA']),
                          Text("Scadenza: " +
                              snapshot.data['data'][i]
                                  ['DATA_SCADENZA_CONTRATTO']),
                          Text(
                              "Ramo: " + snapshot.data['data'][i]['DESC_RAMO']),
                          Text("Frazionamento: " +
                              snapshot.data['data'][i]['FRAZIONAMENTO']),
                          Text("Premio: " +
                              snapshot.data['data'][i]['PREMIO_NETTO']),
                        ],
                      ),
                    ),
                  ),
              ],
            );
          } else {
            return const Placeholder();
          }
        } else {
          return const CircularProgressIndicator(
            color: constants.COLORE_PRINCIPALE,
          );
        }
      },
    );
  }
}
