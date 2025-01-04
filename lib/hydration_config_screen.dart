import 'package:flutter/material.dart';

class HydrationConfigScreen extends StatefulWidget {
  @override
  _HydrationConfigScreenState createState() => _HydrationConfigScreenState();
}

class _HydrationConfigScreenState extends State<HydrationConfigScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _notificationsController = TextEditingController();
  final TextEditingController _goalController = TextEditingController();
  String? userName;
  int? notificationsPerDay;
  double? dailyWaterGoal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações de Hidratação'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildTextField(
              controller: _nameController,
              label: 'Como deseja ser chamado?',
              hint: 'Digite seu nome',
            ),
            SizedBox(height: 16),
            _buildTextField(
              controller: _notificationsController,
              label: 'Quantas notificações por dia?',
              hint: 'Ex: 8',
              inputType: TextInputType.number,
            ),
            SizedBox(height: 16),
            _buildTextField(
              controller: _goalController,
              label: 'Meta diária de água (litros)',
              hint: 'Ex: 2.5',
              inputType: TextInputType.number,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _saveConfigurations,
              child: Text('Salvar Configurações'),
            ),
            if (userName != null && notificationsPerDay != null && dailyWaterGoal != null)
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  'Olá, $userName! Você receberá $notificationsPerDay notificações por dia para atingir sua meta de ${dailyWaterGoal!.toStringAsFixed(1)} litros de água.',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    TextInputType inputType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(height: 8),
        TextField(
          controller: controller,
          keyboardType: inputType,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: hint,
          ),
        ),
      ],
    );
  }

  void _saveConfigurations() {
    setState(() {
      userName = _nameController.text.trim();
      notificationsPerDay = int.tryParse(_notificationsController.text.trim());
      dailyWaterGoal = double.tryParse(_goalController.text.trim());
    });
  }
}
