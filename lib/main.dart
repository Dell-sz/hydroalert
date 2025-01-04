import 'hydration_config_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HydroAlert',
      home: HydrationConfigScreen(),
    );
  }
}
