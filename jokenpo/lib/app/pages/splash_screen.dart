import 'package:flutter/material.dart';

import 'pagina_inicial.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.deepPurple,
              Color.fromARGB(255, 214, 134, 228),
            ],
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Center(
                    child: Image.asset("images/IMAGEM_LEGAL.png"),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: Text(
                          "COMEÇAR",
                          style: TextStyle(
                            color: Colors.white,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return PaginaInicial();
                              },
                            ),
                          );
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(20),
                          child: Icon(
                            Icons.play_arrow,
                            size: 40,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          primary: const Color.fromARGB(255, 146, 83, 254),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
