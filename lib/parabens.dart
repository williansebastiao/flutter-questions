import 'package:flutter/material.dart';

class Parabens extends StatelessWidget {

  final String texto;
  final int pontuacao;
  final void Function() reinciarQuestionario;

  Parabens(this.texto, this.pontuacao, this.reinciarQuestionario);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget> [
        Center(
          child: Text(texto, style: const TextStyle(fontSize: 30)),
        ),
        Center(
          child: Text(pontuacao.toString(), style: const TextStyle(fontSize: 15)),
        ),
        ElevatedButton(onPressed: reinciarQuestionario, child: const Text('Reiniciar'))
      ],
    );
  }
}

