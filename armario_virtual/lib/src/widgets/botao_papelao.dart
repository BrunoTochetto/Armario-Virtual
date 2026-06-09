// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// Botão a ser construído com uma imagem.
class BotaoPapelao extends StatefulWidget {

  const BotaoPapelao({
    super.key,
    required this.onPressed,
    this.imagem = '',
    this.animado = true,
    this.texto = '',
  });

  final String imagem;
  final VoidCallback onPressed;
  final bool animado; 
  final String texto;

  @override
  State<BotaoPapelao> createState() => _BotaoPapelaoState();
}

class _BotaoPapelaoState extends State<BotaoPapelao> {
  
  final List<double> _valoresPosicao = [0, 1, -1, 4, -4];
  int _rotationX = 0;

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.rotationZ(_valoresPosicao[_rotationX]),
      alignment: AlignmentGeometry.center,
      child: ElevatedButton (
        onPressed: widget.onPressed,
        onHover: (value) {
          if (_rotationX >= _valoresPosicao.length - 1) {
              _rotationX = 0;
            } else {
              _rotationX += 1;
            }
            setState(() {});
        },
      
        child: Row(
          children: [
            widget.imagem.isNotEmpty ? Image.asset(widget.imagem) : SizedBox(width: 0, height: 0,),
            Text(widget.texto)
          ],
        ),
      ),
    );
  }
}

