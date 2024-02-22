import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text('Coordinate Detector'),
        ),
        body: Center(
          child: CoordinateDetector(),
        ),
      ),
    );
  }
}

class CoordinateDetector extends StatefulWidget {
  @override
  _CoordinateDetectorState createState() => _CoordinateDetectorState();
}

class _CoordinateDetectorState extends State<CoordinateDetector> {
  String coordinates = '';
  double size = 0;
  DateTime? lastUpdateTime;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    if (screenWidth < screenHeight) {
      size = screenWidth * 0.95;
    } else {
      size = screenHeight * 0.95;
    }

    return GestureDetector(
      onTapDown: (details) {
        _updateCoordinates(details.localPosition, size);
      },
      onPanUpdate: (details) {
        _updateCoordinatesIfNeeded(details.localPosition, size);
      },
      child: Container(
        width: size,
        height: size,
        color: Colors.grey[300],
        child: Image.asset(
          'assets/graph.png', // Replace with your image path
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  void _updateCoordinatesIfNeeded(Offset localOffset, double size) {
    if (lastUpdateTime == null ||
        DateTime.now().difference(lastUpdateTime!) >= Duration(seconds: 1)) {
      _updateCoordinates(localOffset, size);
      lastUpdateTime = DateTime.now();
    }
  }

  void _updateCoordinates(Offset localOffset, double size) {
    final center = Offset(size / 2, size / 2);

    final dx = localOffset.dx - center.dx;
    final dy = localOffset.dy - center.dy;

    final x = dx.toInt() == 0 ? 0 : dx.toInt() ~/ 2;
    int y = dy.toInt() == 0 ? 0 : dy.toInt() ~/ 2;
    y = y * (-1);

    final timestamp = DateTime.now();

    final newCoordinates = '($x, $y) at $timestamp';

    setState(() {
      coordinates = newCoordinates;
    });

    // Show Snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(newCoordinates),
        duration: const Duration(milliseconds: 1000),
      ),
    );
  }
}
