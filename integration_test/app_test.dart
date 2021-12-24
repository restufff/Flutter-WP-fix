import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_wordpress_app/main.dart' as app;
import 'package:flutter_wordpress_app/pages/articles.dart';
import 'package:flutter_wordpress_app/pages/search.dart';
import 'package:flutter_wordpress_app/pages/single_article.dart';
import 'package:flutter_wordpress_app/widgets/searchBoxes.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  group("description", () {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();
    testWidgets("description", (tester) async {
      app.main();
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.search));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(Key("pattern-pencarian")));
      await tester.pumpAndSettle();
      await tester.enterText(find.byType(TextField), 'mahasiswa');
      await tester.pumpAndSettle();
      await tester.pump(new Duration(milliseconds: 1000));
      await tester.pumpAndSettle();
      await tester.tap(find.text(
          "Fakultas Biologi UNAS Mendukung Kompetensi Diri Mahasiswa di Era Socie..."));
      await tester.pumpAndSettle();
      await tester.pump((new Duration(milliseconds: 10000)));
    });
  });

  // testWidgets(
  //   "description",
  //   (WidgetTester tester) async {
  //     await tester.pumpWidget(MyApp());

  //     // await tester.tap(find.byIcon(Icons.search));
  //     //await tester.tap(find.byKey(Key("pattern-pencarian")));
  //     await tester.pumpAndSettle();

  //     expect(find.byType(SingleChildScrollView), findsOneWidget);
  //   },
  // );

  // testWidgets(
  //   "Mencari Suatu Berita Dengan Pattern mahasiswa",
  //   (WidgetTester tester) async {
  //     await tester.pumpWidget(Scaffold());

  //     // await tester.tap(find.byIcon(Icons.search));
  //     // await tester.pumpAndSettle();
  //     // final inputText = find.byKey(const Key('pattern-pencarian'));
  //     // await tester.enterText(inputText, "mahasiswa");
  //     await tester.enterText(find.byType(TextField), 'mahasiswa');
  //     await tester.pumpAndSettle();
  //     await tester.tap(find.byType(Column));

  //     // expect(find.byType(SingleArticle), findsOneWidget);
  //   },
  // );
}
