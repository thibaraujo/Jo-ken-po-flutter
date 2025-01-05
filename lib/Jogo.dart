import 'dart:math';
import 'package:flutter/material.dart';

Map sorteiaOpcao() {
  List<Map> opcoes = [
    {"nome": "pedra", "imagem": "images/pedra.png"},
    {"nome": "papel", "imagem": "images/papel.png"},
    {"nome": "tesoura", "imagem": "images/tesoura.png"}
  ];

  Random random = Random();
  return opcoes[random.nextInt(3)];
}

String verificaVencedor(String escolhaUser, String escolhaApp) {
  if (escolhaUser == escolhaApp) {
    return "Empate";
  } else if ((escolhaUser == "pedra" && escolhaApp == "tesoura") ||
      (escolhaUser == "papel" && escolhaApp == "pedra") ||
      (escolhaUser == "tesoura" && escolhaApp == "papel")) {
    return "Usuário";
  } else {
    return "Robô 🤖";
  }
}

Color defineCorCampeao(String vencedor) {
  if (vencedor == "Usuário") {
    return Colors.green;
  } else if (vencedor == "Robô 🤖") {
    return Colors.red;
  } else {
    return const Color.fromARGB(255, 156, 146, 0);
  }
}

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  String _escolhaUser = "Não escolhido";
  Map _escolhaApp = {"nome": "Não sorteado", "imagem": Image.asset("images/padrao.png")};
  bool _escolhaAppLiberada = false;
  String _vencedor = "Não definido";

  @override
  Widget build(BuildContext context) {  
    return Scaffold(
      appBar: AppBar(
        title: Text("Jo Ken Po"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              "🤖 Escolha do Robô 🤖",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            _escolhaAppLiberada
                ? Image.asset(_escolhaApp["imagem"], height: 100)
                : Image.asset("images/padrao.png", height: 100),

            Text(
              "Escolha uma opção:",
              style: TextStyle(
                fontSize: 16,

              )
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _escolhaUser = "pedra";
                      _escolhaAppLiberada = true;
                      _escolhaApp = sorteiaOpcao();
                      _vencedor = verificaVencedor(_escolhaUser, _escolhaApp["nome"]);
                    });
                  },
                  child: Image.asset("images/pedra.png", height: 100),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _escolhaUser = "papel";
                      _escolhaAppLiberada = true;
                      _escolhaApp = sorteiaOpcao();
                      _vencedor = verificaVencedor(_escolhaUser, _escolhaApp["nome"]);
                    });
                  },
                  child: Image.asset("images/papel.png", height: 100),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _escolhaUser = "tesoura";
                      _escolhaAppLiberada = true;
                      _escolhaApp = sorteiaOpcao();
                      _vencedor = verificaVencedor(_escolhaUser, _escolhaApp["nome"]);
                    });
                  },
                  child: Image.asset("images/tesoura.png", height: 100),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  "Escolha do usuário: $_escolhaUser",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Escolha do robô: ${_escolhaApp["nome"]}",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Vencedor: ${_vencedor}",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: defineCorCampeao(_vencedor),
                  ),
                ),
              ],
            )
           
          ],
        ),
      ),
    );
  }
}
