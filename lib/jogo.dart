import 'package:flutter/material.dart';
import 'dart:math';

class jogo extends StatefulWidget {
  @override
  _jogoState createState() => _jogoState();
}

class _jogoState extends State<jogo> {

   var _imagemApp = AssetImage("imagens/padrao.png");
   var _mensagem = "Escolha uma opção abaixo";
   void _opcaoSelecionada(String escolhaUsuario) {
     var opcoes = ["pedra", "papel", "tesoura"];
     var numero = Random().nextInt(3);
     var escolhaApp = opcoes[numero];

     print("Escolha do App: " + escolhaApp);
     print("Escolha do Usuario" + escolhaUsuario);

    //Exibição da imagem escolhida pelo app
    switch (escolhaApp) {
      case "pedra" :
        setState(() {
          this._imagemApp = AssetImage("imagens/pedra.png");
        });
        break;

      case "papel" :
        setState(() {
          this._imagemApp = AssetImage("imagens/papel.png");
        });
        break;

      case "tesoura" :
        setState(() {
          this._imagemApp = AssetImage("imagens/tesoura.png");
        });
        break;
    }

    //Validadção do ganhador
    //Usuario Ganhador

    if (
         (escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
         (escolhaUsuario == "tesoura" && escolhaApp == "papel") ||
         (escolhaUsuario == "papel" && escolhaApp == "pedra")
    ) {
      setState(() {
        this._mensagem = "Parabéns você ganhou!!";
      });

      //App ganhador
    } else if (
        (escolhaApp == "pedra" && escolhaUsuario == "tesoura") ||
        (escolhaApp == "tesoura" && escolhaUsuario == "papel") ||
        (escolhaApp == "papel" && escolhaUsuario == "pedra")
    ) {
      setState(() {
        this._mensagem = "Você perdeu!!";
      });
    } else {
      setState(() {
        this._mensagem = "Empatamos";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text ("JokenPo"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //1)Text
          //2)Imagem
          //3)Text resultado
          //4)Linha 3 imagens

          Padding(
              padding: EdgeInsets.only(top: 32, bottom: 16),
              child: Text(
                  "Escolha do App",
                   textAlign: TextAlign.center,
                   style: TextStyle(
                     color: Colors.green,
                     fontSize: 20,
                 //    fontWeight: FontWeight.bold
                   ),
              ),
          ),
          Image(
            image: this._imagemApp,
          ),

          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
                this._mensagem,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 20,
                   // fontWeight: FontWeight.bold
                )
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () => _opcaoSelecionada("pedra"),
                child: Image.asset("imagens/pedra.png", height: 100,),
              ),

              GestureDetector(
                onTap: () => _opcaoSelecionada("papel"),
                child: Image.asset("imagens/papel.png", height: 100,),
              ),

              GestureDetector(
                onTap: () => _opcaoSelecionada("tesoura"),
                child: Image.asset("imagens/tesoura.png", height: 100,)
              )

              /*
              Image.asset("imagens/pedra.png", height: 100,),
              Image.asset("imagens/papel.png", height: 100,),
              Image.asset("imagens/tesoura.png", height: 100,)
              */
            ],
          )
        ],
      ),

    );
  }
}
