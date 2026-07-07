//botão da tela inicial para mostrar e passar as roupas -> por enquanto estático

import 'package:flutter/material.dart';
import './roupaCard.dart';
import '../../model/roupa.dart';
import '../widgets/decorators/animator.dart';

class PassarRoupa extends StatefulWidget {
  final String fundo;
  final String iconePadrao;
  final List<Map<String, dynamic>> roupaLista;

  const PassarRoupa({
    super.key,
    required this.fundo,
    required this.iconePadrao,
    required this.roupaLista,
  });

  @override
  State<PassarRoupa> createState() => _PassarRoupaState();
}

class _PassarRoupaState extends State<PassarRoupa> {
  late List<Map<String, dynamic>>? roupaLista;

  @override
  void initState() {
    super.initState();
    roupaLista = widget.roupaLista;
  }

  int index = 0;

  @override
  Widget build(BuildContext context) {
    late Map<String, dynamic> valoresAtuais;
    int maxIndex = 0;
    if (roupaLista!.isNotEmpty) {
      valoresAtuais = roupaLista![index];
      maxIndex = roupaLista!.length - 1;
    } else {
      valoresAtuais = {};
    }

    Widget botaoEsquerdaWidget = maxIndex != 0
        ? GestureDetector(
            onTap: () {
              setState(() {
                if (index <= 0) {
                  index = maxIndex;
                } else {
                  index--;
                }
              });
            },
            child: Image.asset('assets/botoes/setaEsquerda.png', width: 40),
          )
        : SizedBox();

    Roupa? roupaAtualCriada;
    if (valoresAtuais.isNotEmpty) {
      roupaAtualCriada = Roupa(
        categoria: valoresAtuais["categoria"],
        imagem: valoresAtuais["imagem"],
      );
    }
    Widget roupaWidget = RoupaCard(
      roupa: roupaAtualCriada,
      iconePadrao: widget.iconePadrao,
      papelFundo: widget.fundo,
      width: MediaQuery.of(context).size.width * 0.5,
    );

    Widget botaoDireitaWidget = maxIndex != 0
        ? GestureDetector(
            onTap: () {
              setState(() {
                if (index >= maxIndex) {
                  index = 0;
                } else {
                  index++;
                }
              });
            },
            child: Image.asset('assets/botoes/setaDireita.png', width: 40),
          )
        : SizedBox();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Animator(offsetAnimation: 3, duration: Duration(seconds:9), child: botaoEsquerdaWidget),

        Animator(offsetAnimation: index, child: roupaWidget),

        Animator(offsetAnimation: 5, duration: Duration(seconds:9), child: botaoDireitaWidget,),
      ],
    );
  }
}
