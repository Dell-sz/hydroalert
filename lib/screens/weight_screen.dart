import 'package:flutter/material.dart';
import 'summary_screen.dart';

class WeightScreen extends StatelessWidget {
  final String userName;
  final int notifications;
  final TextEditingController _currentWeightController = TextEditingController();
  final TextEditingController _goalWeightController = TextEditingController();

  WeightScreen({required this.userName, required this.notifications});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Configuração - Peso')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Qual é o seu peso atual?', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            TextField(
              controller: _currentWeightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Ex: 70',
              ),
            ),
            SizedBox(height: 16),
            Text('Qual é sua meta de peso?', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            TextField(
              controller: _goalWeightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Ex: 65',
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final currentWeight = double.tryParse(_currentWeightController.text.trim());
                final goalWeight = double.tryParse(_goalWeightController.text.trim());
                if (currentWeight != null && goalWeight != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SummaryScreen(
                        userName: userName,
                        notifications: notifications,
                        currentWeight: currentWeight,
                        goalWeight: goalWeight,
                      ),
                    ),
                  );
                }
              },
              child: Text('Avançar'),
            ),
          ],
        ),
      ),
    );
  }
}
