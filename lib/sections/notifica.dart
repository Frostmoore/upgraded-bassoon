import 'package:flutter/material.dart';
import 'package:agenzia_x/assets/constants.dart' as constants;

class Notifica extends StatelessWidget {
  const Notifica({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            style: BorderStyle.solid,
            color: Colors.black,
          ),
          color: Color.fromARGB(25, 255, 0, 0),
        ),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                'ATTENZIONE!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: const Color.fromARGB(255, 119, 20, 13),
                ),
              ),
              Text(
                constants.NOTIFICA_TEXT,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
