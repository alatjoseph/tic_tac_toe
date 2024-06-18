import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/gamepg.dart';

class Registration extends StatelessWidget {
  Registration({super.key});
  final TextEditingController _player1Controller = TextEditingController();
  final TextEditingController _player2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 12,
              ),
              const Text(
                'Think ahead, plan your moves,\n  and win the game!.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 10,
              ),
              const Text(
                'Register Players ',
                style: TextStyle(
                    color: Colors.amber,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(28.0),
                child: Column(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: TextFormField(
                          controller: _player1Controller,
                          decoration: const InputDecoration(
                              prefixIcon:
                                  Icon(Icons.person, color: Colors.black),
                              hintText: 'Enter Player 1 Name',
                              border: InputBorder.none),
                          onChanged: (value) {},
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: TextFormField(
                          controller: _player2Controller,
                          decoration: const InputDecoration(
                              prefixIcon:
                                  Icon(Icons.person, color: Colors.black),
                              hintText: 'Enter Player 2 Name',
                              border: InputBorder.none),
                          onChanged: (value) {},
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 9,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          String p1 = _player1Controller.text.toString();
                          String p2 = _player2Controller.text.toString();
                          _player1Controller.clear();
                          _player2Controller.clear();
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Game_page(
                                    player1: p1,
                                    player2: p2,
                                  )));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber,
                        ),
                        child: const Text(
                          'Play Now',
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
