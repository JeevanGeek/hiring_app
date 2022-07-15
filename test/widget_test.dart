import 'package:flutter_test/flutter_test.dart';

import 'package:hiring_app/screens/app/app.dart';

void main() {
  testWidgets('', (WidgetTester tester) async {
    await tester.pumpWidget(const HiringApp());
  });
}
