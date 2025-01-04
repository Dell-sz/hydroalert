import 'package:flutter/material.dart';

class HydrationConfigScreen extends StatefulWidget {
  @override
  _HydrationConfigScreenState createState() => _HydrationConfigScreenState();
}

class _HydrationConfigScreenState extends State<HydrationConfigScreen> {
  final TextEditingController _nameController = TextEditingController();
  String? userName; // Nome do usuário armazenado após salvar

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configuração Inicial'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Como deseja ser chamado?',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Digite seu nome aqui',
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  userName = _nameController.text.trim();
                });
              },
              child: Text('Salvar Nome'),
            ),
            SizedBox(height: 16),
            if (userName != null)
              Text(
                'Olá, $userName! Vamos configurar sua hidratação.',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
          ],
        ),
      ),
    );
  }
}
