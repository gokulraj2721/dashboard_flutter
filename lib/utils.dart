import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
// Import your utils.dart file

class PieChartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Basic Pie Chart'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: PieChart(
          PieChartData(
            sections: showingSections(),
            borderData: FlBorderData(show: false),
            sectionsSpace: 0,
            centerSpaceRadius: 40,
          ),
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return [
      PieChartSectionData(
         // Using utility function for color
        value: 30,
        title: 'Red',
        radius: 60,
      ),
      PieChartSectionData(
        // Using utility function for color
        value: 40,
        title: 'Blue',
        radius: 60,
      ),
      PieChartSectionData(
         // Using utility function for color
        value: 30,
        title: 'Green',
        radius: 60,
      ),
    ];
  }
}
