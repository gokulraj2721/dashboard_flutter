import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fl_chart/fl_chart.dart';  // Import for PieChart
import 'package:pie_chart_app/main.dart';
// Import the PieChartPage

void main() {
  testWidgets('Pie chart displays correctly', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that the PieChart is displayed.
    expect(find.byType(PieChart), findsOneWidget);

    // Check if the AppBar title is present.
    expect(find.text('Basic Pie Chart'), findsOneWidget);

    // Check for the presence of pie chart sections
    expect(find.text('Red'), findsOneWidget);
    expect(find.text('Blue'), findsOneWidget);
    expect(find.text('Green'), findsOneWidget);
  });
}
