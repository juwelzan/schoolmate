import 'package:flutter_test/flutter_test.dart';
import 'package:schoolmate/main.dart';

void main() {
  testWidgets('App should render initial route properly', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());
    
    // Pump once to render initial frame
    await tester.pump();

    // Verify that the initial splash screen is rendered
    expect(find.text('Schoolmate'), findsOneWidget);
  });
}
