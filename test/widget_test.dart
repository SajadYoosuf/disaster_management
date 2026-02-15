import 'package:flutter_test/flutter_test.dart';
import 'package:edu_admin/main.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const EduAdminApp());

    // Verify that the app builds.
    expect(find.byType(EduAdminApp), findsOneWidget);
  });
}
