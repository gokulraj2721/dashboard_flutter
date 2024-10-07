import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class PieChartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Charts Page'),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Pie Charts',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 350, // Moderately increased height for pie charts
                    child: PieChart(_createPieChartData1()),
                  ),
                ),
                const SizedBox(width: 10), // Reduced space between the charts
                Expanded(
                  child: SizedBox(
                    height: 350, // Moderately increased height for pie charts
                    child: PieChart(_createPieChartData2()),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Line Chart 1',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 200, // Height for line chart 1 remains the same
              child: LineChart(_createLineChartData1()),
            ),
            const SizedBox(height: 20),
            const Text(
              'Line Chart 2',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 200, // Height for line chart 2 remains the same
              child: LineChart(_createLineChartData2()),
            ),
          ],
        ),
      ),
    );
  }

  // Pie chart 1
  PieChartData _createPieChartData1() {
    return PieChartData(
      sections: [
        PieChartSectionData(color: Colors.red, value: 30, title: 'Red', radius: 100), // Moderately increased radius
        PieChartSectionData(color: Colors.blue, value: 40, title: 'Blue', radius: 100), // Moderately increased radius
        PieChartSectionData(color: Colors.green, value: 30, title: 'Green', radius: 100), // Moderately increased radius
      ],
      sectionsSpace: 0, // No space between sections
      centerSpaceRadius: 40, // Proportionate center space radius
      borderData: FlBorderData(show: false),
    );
  }

  // Pie chart 2
  PieChartData _createPieChartData2() {
    return PieChartData(
      sections: [
        PieChartSectionData(color: Colors.orange, value: 25, title: 'Orange', radius: 100), // Moderately increased radius
        PieChartSectionData(color: Colors.purple, value: 50, title: 'Purple', radius: 100), // Moderately increased radius
        PieChartSectionData(color: Colors.yellow, value: 25, title: 'Yellow', radius: 100), // Moderately increased radius
      ],
      sectionsSpace: 0, // No space between sections
      centerSpaceRadius: 40, // Proportionate center space radius
      borderData: FlBorderData(show: false),
    );
  }

  // Line chart 1
  LineChartData _createLineChartData1() {
    return LineChartData(
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, 1),
            FlSpot(1, 1.5),
            FlSpot(2, 1.8),
            FlSpot(3, 2),
            FlSpot(4, 2.5),
            FlSpot(5, 3),
          ],
          isCurved: true,
          color: Colors.red.withOpacity(0.4),
          barWidth: 2, 
          isStrokeCapRound: true,
          dotData: FlDotData(show: false), 
          belowBarData: BarAreaData(
            show: true,
            color: Colors.red.withOpacity(0.1),
          ),
        ),
      ],
      gridData: FlGridData(show: false),
      borderData: FlBorderData(show: true),
      titlesData: FlTitlesData(show: true),
      minX: 0,
      maxX: 5,
      minY: 0,
      maxY: 3,
    );
  }

  // Line chart 2
  LineChartData _createLineChartData2() {
    return LineChartData(
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, 2),
            FlSpot(1, 2.5),
            FlSpot(2, 3),
            FlSpot(3, 3.5),
            FlSpot(4, 4),
            FlSpot(5, 4.5),
          ],
          isCurved: true,
          color: Colors.blue.withOpacity(0.4),
          barWidth: 2,
          isStrokeCapRound: true,
          dotData: FlDotData(show: false),
          belowBarData: BarAreaData(
            show: true,
            color: Colors.blue.withOpacity(0.1),
          ),
        ),
      ],
      gridData: FlGridData(show: false),
      borderData: FlBorderData(show: true),
      titlesData: FlTitlesData(show: true),
      minX: 0,
      maxX: 5,
      minY: 0,
      maxY: 5,
    );
  }
}
