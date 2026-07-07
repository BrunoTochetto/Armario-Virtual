// icone de dentro dos armários para apresentar a roupa dentro.
import 'package:flutter/material.dart';
import '../../model/roupa.dart';

class RoupaCard extends StatelessWidget {
  final Roupa? roupa;
  final String papelFundo;
  final String iconePadrao;
  final double width;
  final double height;


  const RoupaCard({
    super.key,
    this.roupa,
    this.papelFundo = "fundoFotos",
    this.iconePadrao = '',
    this.width = 140,
    this.height = 140,
  });

  @override
  Widget build(BuildContext context) {
    Widget roupaWidget/* = SizedBox(width: 1, height: 1,)*/;
    if (roupa == null || roupa!.imagem.isEmpty) {
      roupaWidget = Image.asset(iconePadrao, width: MediaQuery.of(context).size.width * 0.5,);
    } else {
      roupaWidget = Image.memory(roupa!.imagem, fit: BoxFit.contain);
    }
    
    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/fundo/$papelFundo.png',
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18),
            child: roupaWidget
          ),
        ],
      ),
    );
  }
}