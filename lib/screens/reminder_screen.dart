import 'package:flutter/material.dart';
import 'notification_screen.dart';

class ReminderScreen extends StatelessWidget {
  final String name;
  final double waterIntake;

  const ReminderScreen({required this.name, required this.waterIntake});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _remindersController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('HydroAlert - Lembretes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Você precisa beber ${waterIntake.toStringAsFixed(0)} ml de água por dia.',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Quantas vezes por dia você quer ser lembrado?',
              style: TextStyle(fontSize: 18),
            ),
            TextField(
              controller: _remindersController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText: 'Número de lembretes'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final reminders = int.tryParse(_remindersController.text.trim());
                if (reminders != null && reminders > 0) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NotificationScreen(
                        waterIntake: waterIntake,
                        reminders: reminders,
                      ),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Insira um número válido de lembretes.')),
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
