import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';
import 'package:agenzia_x/sections/chiamata_rapida.dart';
// import 'package:webview_flutter/webview_flutter.dart';
// import 'package:intl/intl.dart';import 'package:agenzia_x/assets/constants.dart' as constants;
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
//import 'package:notification_permissions/notification_permissions.dart';
import 'package:agenzia_x/assets/constants.dart' as constants;

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  int _selectedIndex = 0;
  Future getData() async {
    var url = Uri.https(constants.PATH, constants.ENDPOINT,
        {'id': constants.ID, 'token': constants.TOKEN});
    // print(url);
    var response = await http.get(url);
    var responseBody = convert.jsonDecode(response.body) as Map;
    // print(responseBody); // Remove in production
    return responseBody;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 0) {
        Navigator.pop(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return FutureBuilder(
      future: getData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
              title: const Text(constants.TITOLO_FORM_DENUNCIA),
            ),
            body: Container(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      constants.SPACER,
                      const Center(
                        child: Text(
                          "LE MIE POLIZZE",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Center(
                        child: Text(
                          "Ciao %NOME%, controlla i dettagli delle tue polizze e verificane i dati, qui avrai tutte le informazioni di cui potresti aver bisogno.",
                          textAlign: TextAlign.center,
                        ),
                      ),
                      constants.SPACER,
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
                              child: const Padding(
                                padding: EdgeInsets.fromLTRB(8, 18, 8, 8),
                                child: Text(
                                  "Polizza n. 1",
                                  textAlign: TextAlign.start,
                                  style: constants.H1,
                                ),
                              ),
                            ),
                            content: Text("Info Polizza n. 1"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            floatingActionButton: ChiamataRapida(data: snapshot.data),
            bottomNavigationBar: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Agenzia',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.account_box),
                  label: 'Account',
                ),
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: constants.COLORE_PRINCIPALE,
              onTap: _onItemTapped,
            ),
          );
        } else {
          return Container(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(constants.COLORE_PRINCIPALE),
              ),
            ),
          );
        }
      },
    );
  }
}
