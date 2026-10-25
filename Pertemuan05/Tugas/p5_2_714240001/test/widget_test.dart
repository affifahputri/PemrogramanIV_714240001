import 'package:flutter_test/flutter_test.dart';

import 'package:p5_2_714240001/main.dart';

void main() {
  testWidgets('Home screen shows profile information', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Tugas Pertemuan 5'), findsOneWidget);
    expect(find.text('Affifah Putri Deza'), findsOneWidget);
    expect(find.text('714240001'), findsOneWidget);
    expect(find.text('Lihat Detail Profil'), findsOneWidget);
  });

  testWidgets('Detail screen opens and shows profile details', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text('Lihat Detail Profil'));
    await tester.pumpAndSettle();

    expect(find.text('Detail Profil'), findsOneWidget);
    expect(find.text('Affifah Putri Deza'), findsOneWidget);
    expect(find.text('NPM: 714240001'), findsOneWidget);
    expect(find.text('Gallery Aktivitas'), findsOneWidget);
  });
}
