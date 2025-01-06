import 'package:flutter/material.dart';
import 'reminder_screen.dart';

class WeightScreen extends StatefulWidget {
  final String name;

  const WeightScreen({required this.name});

  @override
  _WeightScreenState createState() => _WeightScreenState();
}

class _WeightScreenState extends State<WeightScreen> {
  final TextEditingController _currentWeightController = TextEditingController();
  final TextEditingController _targetWeightController = TextEditingController();

  double? _waterIntake;

  void _calculateWaterIntake() {
    try {
      final currentWeight = double.parse(_currentWeightController.text.trim());
      final targetWeight = double.parse(_targetWeightController.text.trim());

      if (currentWeight > 0 && targetWeight > 0) {
        setState(() {
          if (targetWeight < currentWeight) {
            _waterIntake = currentWeight * 30; // Emagrecendo
          } else if (targetWeight > currentWeight) {
            _waterIntake = currentWeight * 50; // Ganho de massa
          } else {
            _waterIntake = currentWeight * 40; // Manutenção
          }
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Insira valores válidos para o peso.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HydroAlert - Peso'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Digite seu peso atual (kg):',
              style: TextStyle(fontSize: 18),
            ),
            TextField(
              controller: _currentWeightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText: 'Peso atual'),
            ),
            SizedBox(height: 10),
            Text(
              'Digite seu peso desejado (kg):',
              style: TextStyle(fontSize: 18),
            ),
            TextField(
              controller: _targetWeightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText: 'Peso desejado'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _calculateWaterIntake();
                if (_waterIntake != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ReminderScreen(
                        name: widget.name,
                        waterIntake: _waterIntake!,
                      ),
                    ),
                  );
                }
              },
              child: Text('Próximo'),
            ),
          ],
        ),
      ),
    );
  }
}
