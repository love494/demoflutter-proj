import 'package:flutter/material.dart';

void main() {
  runApp(AnimatedHelloApp());
}

class AnimatedHelloApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated Hello',
      home: AnimatedHelloScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AnimatedHelloScreen extends StatefulWidget {
  @override
  _AnimatedHelloScreenState createState() => _AnimatedHelloScreenState();
}

class _AnimatedHelloScreenState extends State<AnimatedHelloScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

    _controller.forward(); // Start animation
  }

  @override
  void dispose() {
    _controller.dispose(); // Clean up controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: ScaleTransition(
          scale: _animation,
          child: FadeTransition(
            opacity: _animation,
            child: Text(
              'Hello, World!',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
                fontFamily: 'Courier',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
