import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double width = 100.0;
  double height = 100.0;
  double borderRadius = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo Home Page'),
      ),
      body: Column(
        children: [
          // Секція з налаштуваннями
          SliderSection(
            label: 'Width',
            value: width,
            min: 50,
            max: 300,
            onChanged: (val) => setState(() => width = val),
          ),
          SliderSection(
            label: 'Height',
            value: height,
            min: 50,
            max: 300,
            onChanged: (val) => setState(() => height = val),
          ),
          SliderSection(
            label: 'Radius',
            value: borderRadius,
            min: 0,
            max: 150,
            onChanged: (val) => setState(() => borderRadius = val),
          ),
          const SizedBox(height: 20),
          // Червоний контейнер
          Flexible(
            child: RedContainer(
              width: width,
              height: height,
              borderRadius: borderRadius,
            ),
          ),
        ],
      ),
    );
  }
}

// Віджет для секції зі слайдером
class SliderSection extends StatelessWidget {
  final String label;
  final double value;
  final double min;
  final double max;
  final ValueChanged<double> onChanged;

  const SliderSection({
    super.key,
    required this.label,
    required this.value,
    required this.min,
    required this.max,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text('$label: ${value.toStringAsFixed(2)}'),
        ),
        Slider(
          value: value,
          min: min,
          max: max,
          onChanged: onChanged,
        ),
      ],
    );
  }
}

// Віджет для червоного контейнера
class RedContainer extends StatelessWidget {
  final double width;
  final double height;
  final double borderRadius;

  const RedContainer({
    super.key,
    required this.width,
    required this.height,
    required this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}
