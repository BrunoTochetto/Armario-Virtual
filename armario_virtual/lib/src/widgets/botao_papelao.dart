// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// Botão a ser construído com uma imagem.
class BotaoPapelao extends StatelessWidget {
  final Image? imagem;
  final Function onPressed;
  final bool? animado; 

  const BotaoPapelao({
    super.key,
    this.imagem,
    required this.onPressed,
    this.animado
  });

  @override
  Widget build(BuildContext context) {

    return AnimatedContainer(
      duration: Duration(seconds: 1),

      
    );
  }
}
