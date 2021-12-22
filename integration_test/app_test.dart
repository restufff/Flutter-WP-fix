import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_wordpress_app/main.dart';
import 'package:flutter_wordpress_app/pages/single_article.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets(
    "description",
    (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());

      await tester.tap(find.byIcon(Icons.search));
      await tester.pumpAndSettle();

      expect(find.byType(SingleChildScrollView), findsOneWidget);
    },
  );

  testWidgets(
    "Mencari Suatu Berita Dengan Pattern mahasiswa",
    (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());

      // await tester.tap(find.byIcon(Icons.search));
      // await tester.pumpAndSettle();
      final inputText = 'mahasiswa';
      await tester.enterText(find.byType(InputDecoration), inputText);
      await tester.tap(find.byType(Column));

      expect(find.byType(SingleArticle), findsOneWidget);
    },
  );
}
