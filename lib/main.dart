import 'package:flutter/material.dart';
import './questionario.dart';
import './parabens.dart';

main() => runApp(new PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final perguntas = const [
    {
      'texto': 'qual sua cor favorita?',
      'resposta': [
        {'texto': 'Azul', 'pontuacao': 50},
        {'texto': 'Rosa', 'pontuacao': 100},
        {'texto': 'Preto', 'pontuacao': 30},
        {'texto': 'Amarelo', 'pontuacao': 0}
      ]
    },
    {
      'texto': 'qual se animal favorito?',
      'resposta': [
        {'texto': 'Cachorro', 'pontuacao': 100},
        {'texto': 'Gato', 'pontuacao': 0},
        {'texto': 'Coruja', 'pontuacao': 80},
        {'texto': 'peixe', 'pontuacao': 30}
      ]
    },
    {
      'texto': 'qual sua linguagem favorita?',
      'resposta': [
        {'texto': 'Python', 'pontuacao': 100},
        {'texto': 'PHP', 'pontuacao': 80},
        {'texto': 'vue', 'pontuacao': 50},
        {'texto': 'Go', 'pontuacao': 0}
      ]
    }
  ];

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  void responder(int pontuacao) {
    if(temPerguntaSelecionada){
      setState(() {
        perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Perguntas'),
          ),
          body: temPerguntaSelecionada ? Questionario(
              perguntas: perguntas,
              perguntaSelecionada: perguntaSelecionada,
              responder: responder) : Parabens('Teste finalizado!', _pontuacaoTotal, _reiniciarQuestionario)
      ),
    );
  }

}

class PerguntaApp extends StatefulWidget {

  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}