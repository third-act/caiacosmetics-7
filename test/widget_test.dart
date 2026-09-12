import 'package:caiacosmetics_7/main.dart';
import 'package:caiacosmetics_7/ui/splash/splash_view.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('App boots with cream canvas and shell', (WidgetTester tester) async {
    await tester.pumpWidget(const CaiaApp());
    expect(find.byType(SplashGate), findsOneWidget);
    expect(find.text('Hem'), findsOneWidget);
    await tester.pump(const Duration(seconds: 2));
    expect(find.text('Hej Emma'), findsOneWidget);
  });
}
