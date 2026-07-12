// icone de dentro dos armários para apresentar a roupa dentro.
import 'package:flutter/material.dart';
import '../../model/roupa.dart';
import '../page/selecaoRoupa.dart';

class RoupaCard extends StatefulWidget {
  final Roupa? roupa;
  final String papelFundo;
  final String iconePadrao;
  final double width;
  final double height;
  final Function? atualizarPaginaQueEsta;
  final bool navegar;
  final GestureTapCallback? funcaoOnTap;
  final bool isLoading;

  const RoupaCard({
    super.key,
    this.roupa,
    this.papelFundo = "fundoFotos",
    this.iconePadrao = '',
    this.width = 140,
    this.height = 140,
    this.atualizarPaginaQueEsta,
    this.navegar = true,
    this.funcaoOnTap,
    this.isLoading = false,
  });

  @override
  State<RoupaCard> createState() => _RoupaCardState();
}

class _RoupaCardState extends State<RoupaCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _rotationController;

  @override
  void initState() {
    super.initState();
    _rotationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..repeat();
  }

  @override
  void dispose() {
    _rotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget roupaWidget;
    if (widget.isLoading) {
      roupaWidget = RotationTransition(
        turns: _rotationController,
        child: Image.asset(
          widget.iconePadrao,
          width: MediaQuery.of(context).size.width * 0.5,
        ),
      );
    } else if (widget.roupa == null || widget.roupa!.imagem.isEmpty) {
      roupaWidget = Image.asset(
        widget.iconePadrao,
        width: MediaQuery.of(context).size.width * 0.5,
      );
    } else {
      roupaWidget = Image.memory(widget.roupa!.imagem, fit: BoxFit.contain);
    }

    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: GestureDetector(
        onTap: () {
          if (widget.isLoading) {
            return;
          }

          if (widget.roupa != null && widget.navegar) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SelecaoRoupa(roupa: widget.roupa!),
              ),
            ).then((_) => widget.atualizarPaginaQueEsta?.call());
          } else {
            widget.funcaoOnTap?.call();
          }
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/fundo/${widget.papelFundo}.png',
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18),
              child: roupaWidget,
            ),
          ],
        ),
      ),
    );
  }
}
