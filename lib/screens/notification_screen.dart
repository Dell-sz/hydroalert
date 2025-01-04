import 'package:flutter/material.dart';
import 'weight_screen.dart';

class NotificationScreen extends StatelessWidget {
  final String userName;
  final TextEditingController _notificationsController = TextEditingController();

  NotificationScreen({required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Configuração - Notificações')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Olá, $userName! Quantas notificações por dia?', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            TextField(
              controller: _notificationsController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Ex: 8',
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final notifications = int.tryParse(_notificationsController.text.trim());
                if (notifications != null && notifications > 0) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WeightScreen(
                        userName: userName,
                        notifications: notifications,
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
