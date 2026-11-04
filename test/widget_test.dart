import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:my_contact/main.dart';

void main() {
  setUpAll(() async {
    await initializeDateFormatting('id_ID', null);
  });

  testWidgets('Aplikasi My Contact berhasil dibuka',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyContactApp());

    expect(find.text('My Contact'), findsOneWidget);
    expect(find.text('Daftar Kontak'), findsOneWidget);
  });
}