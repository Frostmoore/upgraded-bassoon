import 'package:flutter/material.dart';
import 'package:agenzia_x/assets/constants.dart' as constants;

class Header extends StatefulWidget {
  final data;
  Header({super.key, required this.data});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return SizedBox(
      height: 270,
      child: Stack(
        alignment: const Alignment(-1, -1),
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: constants.HEADER,
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            top: 130,
            left: (width / 2 - 70),
            child: const CircleAvatar(
              radius: 70,
              backgroundColor: Colors.grey,
              child: Material(
                elevation: 10,
                borderRadius: BorderRadius.all(Radius.circular(100)),
                child: CircleAvatar(
                  radius: 68,
                  backgroundImage: constants.PROFILE_PICTURE,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
