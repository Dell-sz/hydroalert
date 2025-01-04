import 'package:flutter/material.dart';

class SummaryScreen extends StatelessWidget {
  final String userName;
  final int notifications;
  final double currentWeight;
  final double goalWeight;

  SummaryScreen({
    required this.userName,
    required this.notifications,
    required this.currentWeight,
    required this.goalWeight,
  });

  @override
  Widget build(BuildContext context) {
    final dailyWaterIntake = goalWeight * 0.035; // 35ml por kg
    return Scaffold(
      appBar: AppBar(title: Text('Resumo')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Resumo das Configurações', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text('Nome: $userName'),
            Text('Notificações por dia: $notifications'),
            Text('Peso Atual: ${currentWeight.toStringAsFixed(1)} kg'),
            Text('Peso Meta: ${goalWeight.toStringAsFixed(1)} kg'),
            Text('Meta diária de água: ${dailyWaterIntake.toStringAsFixed(2)} litros'),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              child: Text('Concluir'),
            ),
          ],
        ),
      ),
    );
  }
}
