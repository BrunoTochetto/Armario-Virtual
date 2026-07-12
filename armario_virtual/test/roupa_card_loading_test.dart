import 'package:armario_virtual/src/widgets/roupaCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('aplica rotação apenas no ícone padrão quando isLoading for true', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: RoupaCard(
              isLoading: true,
              iconePadrao: 'assets/icon/iconCabeca.png',
            ),
          ),
        ),
      ),
    );

    expect(find.byType(RotationTransition), findsAtLeastNWidgets(1));
  });
}
