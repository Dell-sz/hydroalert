import 'package:flutter/material.dart';
import 'notification_screen.dart';

class NameScreen extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Configuração - Nome')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Como deseja ser chamado?', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Digite seu nome',
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final name = _nameController.text.trim();
                if (name.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NotificationScreen(userName: name),
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
