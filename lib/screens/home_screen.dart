import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _showMessage(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Hello from the button!")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hello World App')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Hello, Flutter!',
              style: TextStyle(fontSize: 28, color: Colors.blue),
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: "Click Me",
              onPressed: () => _showMessage(context),
            ),
          ],
        ),
      ),
    );
  }
}
