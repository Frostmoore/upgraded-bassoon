import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';
// import 'package:intl/intl.dart';
import 'package:agenzia_x/assets/constants.dart' as constants;

class LoginForm extends StatefulWidget {
  final data;
  const LoginForm({super.key, required this.data});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nome = TextEditingController();
  final TextEditingController _cognome = TextEditingController();
  // final TextEditingController _dataDiNascita = TextEditingController();
  final TextEditingController _codiceFiscale = TextEditingController();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _repeatPassword = TextEditingController();
  var Nome;
  var Cognome;
  DateTime? _dataDiNascita;
  var CodiceFiscale;
  var Username;
  var Password;
  var RepeatPassword;
  bool Privacy = false;

  @override
  Widget build(BuildContext context) {
    // _dataDiNascita = DateTime.now();
    return Container(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              constants.SPACER,
              const Center(
                child: Text(
                  "REGISTRAZIONE UTENTE",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Center(
                child: Text(
                  "Compila il form qui sotto e accetta la liberatoria privacy per registrarti in questa agenzia.",
                  textAlign: TextAlign.center,
                ),
              ),
              constants.SPACER,
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                        onSaved: (value) {
                          Username = value;
                        },
                        decoration: const InputDecoration(
                          labelText: "Username",
                          labelStyle: TextStyle(
                              color: Colors.black87,
                              fontSize: 17,
                              fontFamily: 'AvenirLight'),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.purple),
                          ),
                          enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1.0)),
                        ),
                        controller: _username,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Per proseguire, riempi questo campo.';
                          }
                          return null;
                        }),
                    constants.SPACER_MEDIUM,
                    TextFormField(
                        onSaved: (value) {
                          Password = value;
                        },
                        decoration: const InputDecoration(
                          labelText: "Password",
                          labelStyle: TextStyle(
                              color: Colors.black87,
                              fontSize: 17,
                              fontFamily: 'AvenirLight'),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.purple),
                          ),
                          enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1.0)),
                        ),
                        obscureText: true,
                        enableSuggestions: false,
                        autocorrect: false,
                        controller: _password,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Per proseguire, riempi questo campo.';
                          }
                          return null;
                        }),
                    constants.SPACER_MEDIUM,
                    TextFormField(
                        onSaved: (value) {
                          RepeatPassword = value;
                        },
                        decoration: const InputDecoration(
                          labelText: "Ripeti la Password",
                          labelStyle: TextStyle(
                              color: Colors.black87,
                              fontSize: 17,
                              fontFamily: 'AvenirLight'),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.purple),
                          ),
                          enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1.0)),
                        ),
                        obscureText: true,
                        enableSuggestions: false,
                        autocorrect: false,
                        controller: _repeatPassword,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Per proseguire, riempi questo campo.';
                          }
                          if (value != _password.text) {
                            return "Le Password non combaciano";
                          }
                          return null;
                        }),
                    constants.SPACER_MEDIUM,
                    TextFormField(
                        onSaved: (value) {
                          Nome = value;
                        },
                        decoration: const InputDecoration(
                          labelText: "Nome",
                          labelStyle: TextStyle(
                              color: Colors.black87,
                              fontSize: 17,
                              fontFamily: 'AvenirLight'),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.purple),
                          ),
                          enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1.0)),
                        ),
                        controller: _nome,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Per proseguire, riempi questo campo.';
                          }
                          return null;
                        }),
                    constants.SPACER_MEDIUM,
                    TextFormField(
                        onSaved: (value) {
                          Cognome = value;
                        },
                        decoration: const InputDecoration(
                          labelText: "Cognome",
                          labelStyle: TextStyle(
                              color: Colors.black87,
                              fontSize: 17,
                              fontFamily: 'AvenirLight'),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.purple),
                          ),
                          enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1.0)),
                        ),
                        controller: _cognome,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Per proseguire, riempi questo campo.';
                          }
                          return null;
                        }),
                    constants.SPACER_MEDIUM,
                    TextFormField(
                        onSaved: (value) {
                          CodiceFiscale = value;
                        },
                        decoration: const InputDecoration(
                          labelText: "Codice Fiscale",
                          labelStyle: TextStyle(
                              color: Colors.black87,
                              fontSize: 17,
                              fontFamily: 'AvenirLight'),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.purple),
                          ),
                          enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1.0)),
                        ),
                        controller: _codiceFiscale,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Per proseguire, riempi questo campo.';
                          }
                          return null;
                        }),
                    TextFormField(
                      controller: TextEditingController(
                          text: _dataDiNascita?.toString().substring(0, 10) ??
                              'Non Selezionata'),
                      decoration: const InputDecoration(
                        labelText: 'Data di Nascita',
                        labelStyle: TextStyle(
                            color: Colors.black87,
                            fontSize: 17,
                            fontFamily: 'AvenirLight'),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.purple),
                        ),
                        enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 1.0)),
                      ),
                      onTap: () {
                        _selectDate(context);
                      },
                      readOnly: true,
                    ),
                    constants.SPACER,
                    constants.SPACER_MEDIUM,
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Center(
                        child: Column(
                          children: [
                            Text(
                              'Privacy Policy',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 21,
                              ),
                            ),
                            constants.SPACER_MEDIUM,
                            Text(
                              "Prima di registrarti, assicurati di aver letto la nostra Privacy Policy e di assegnare i tuoi consensi.",
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Processing Data')),
                            );
                            Navigator.pushNamed(context, '/account');
                          }
                        },
                        style: constants.STILE_BOTTONE,
                        child: const Text(
                          "REGISTRATI!",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1918),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _dataDiNascita) {
      setState(() {
        _dataDiNascita = picked;
      });
    }
  }
}
