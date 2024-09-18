import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';
import 'package:agenzia_x/assets/constants.dart' as constants;

class LoginForm extends StatefulWidget {
  final data;
  const LoginForm({super.key, required this.data});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  var Nome;
  var Cognome;
  var DataDiNascita;
  var CodiceFiscale;
  var Username;
  var Password;
  var RepeatPassword;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(children: <Widget>[
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Per proseguire, riempi questo campo.';
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Per proseguire, riempi questo campo.';
                        }
                        return null;
                      }),
                  constants.SPACER_MEDIUM,
                  TextFormField(
                      onSaved: (value) {
                        DataDiNascita = value;
                      },
                      decoration: const InputDecoration(
                        labelText: "Data di Nascita",
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Per proseguire, riempi questo campo.';
                        }
                        return null;
                      }),
                  constants.SPACER_MEDIUM,
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')),
                          );
                        }
                      },
                      child: const Text("Registrati!"),
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
