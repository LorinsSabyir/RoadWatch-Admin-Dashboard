// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '/custom_code/widgets/index.dart';
import '/custom_code/actions/index.dart';
import '/flutter_flow/custom_functions.dart';
import 'package:fl_chart/fl_chart.dart';

class ForecastingChart extends StatefulWidget {
  const ForecastingChart({
    Key? key,
    this.width,
    this.height,
    required this.historicalX,
    required this.historicalY,
    required this.forecastX,
    required this.forecastY,
    required this.actualColor,
    required this.forecastColor,
    required this.minX, // Value from your screenshot: 1.0
    required this.maxX, // Value from your screenshot: 12.0
    required this.minY,
    required this.maxY,
  }) : super(key: key);

  final double? width;
  final double? height;
  final List<int> historicalX;
  final List<int> historicalY;
  final List<int> forecastX;
  final List<int> forecastY;
  final Color actualColor;
  final Color forecastColor;
  final double minX;
  final double maxX;
  final double minY;
  final double maxY;

  @override
  _ForecastingChartState createState() => _ForecastingChartState();
}

class _ForecastingChartState extends State<ForecastingChart> {
  @override
  Widget build(BuildContext context) {
    List<FlSpot> historicalSpots = List.generate(
      widget.historicalX.length,
      (i) => FlSpot(
          widget.historicalX[i].toDouble(), widget.historicalY[i].toDouble()),
    );

    List<FlSpot> forecastSpots = List.generate(
      widget.forecastX.length,
      (i) => FlSpot(
          widget.forecastX[i].toDouble(), widget.forecastY[i].toDouble()),
    );

    return Container(
      width: widget.width,
      height: widget.height,
      padding: const EdgeInsets.only(right: 25, top: 20, bottom: 10, left: 10),
      child: LineChart(
        LineChartData(
          // APPLYING YOUR AXIS BOUNDS HERE
          minX: widget.minX,
          maxX: widget.maxX,
          minY: widget.minY,
          maxY: widget.maxY,

          lineBarsData: [
            // ACTUAL LINE (Solid Yellow)
            LineChartBarData(
              spots: historicalSpots,
              isCurved: true,
              color: widget.actualColor,
              barWidth: 3,
              dotData: FlDotData(
                show: true,
                getDotPainter: (spot, percent, barData, index) =>
                    FlDotCirclePainter(
                  radius: 4,
                  color: widget.actualColor,
                  strokeWidth: 2,
                  strokeColor:
                      Colors.white, // Matches the dot style in your image
                ),
              ),
            ),
            // FORECAST LINE (Dashed)
            if (forecastSpots.isNotEmpty)
              LineChartBarData(
                spots: forecastSpots,
                isCurved: true,
                color: widget.forecastColor,
                barWidth: 3,
                dashArray: [6, 4],
                dotData: FlDotData(
                  show: true,
                  getDotPainter: (spot, percent, barData, index) =>
                      FlDotCirclePainter(
                    radius: 4,
                    color: widget.forecastColor,
                    strokeWidth: 2,
                    strokeColor: Colors.white,
                  ),
                ),
              ),
          ],

          // GRID STYLING (Matching the dashed grey lines in your screenshot)
          gridData: FlGridData(
            show: true,
            drawVerticalLine: true,
            getDrawingHorizontalLine: (value) => FlLine(
              color: Color(0xFFD1D5DB),
              strokeWidth: 1,
              dashArray: [5, 5],
            ),
            getDrawingVerticalLine: (value) => FlLine(
              color: Color(0xFFD1D5DB),
              strokeWidth: 1,
              dashArray: [5, 5],
            ),
          ),

          // AXIS TITLES
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              axisNameWidget: const Text("Total Number of Violations",
                  style: TextStyle(fontSize: 12)),
              sideTitles: SideTitles(showTitles: true, reservedSize: 40),
            ),
            bottomTitles: AxisTitles(
              axisNameWidget:
                  const Text("Month", style: TextStyle(fontSize: 12)),
              sideTitles:
                  SideTitles(showTitles: true, interval: 1, reservedSize: 30),
            ),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),

          borderData: FlBorderData(
            show: true,
            border: Border(
              bottom: BorderSide(color: Color(0xFFD1D5DB), width: 1),
              left: BorderSide(color: Color(0xFFD1D5DB), width: 1),
            ),
          ),
        ),
      ),
    );
  }
}
