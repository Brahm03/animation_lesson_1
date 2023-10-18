import 'package:flutter/material.dart';
import 'dart:math' show pi;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: const ColorScheme.dark(primary: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));

    _animationController.repeat();
    _animation =
        Tween<double>(begin: 00, end: 2 * pi).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) => Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()..rotateY(_animation.value),
                  child: Container(
                    height: 100,
                    width: 100,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(100),
                        boxShadow: [
                          BoxShadow(
                              offset: const Offset(10, 0),
                              color: Colors.yellowAccent.withOpacity(0.5),
                              blurRadius: 50)
                        ]),
                    child: const Text('\$',
                        style:
                            TextStyle(fontSize: 50, fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
              Text('BitCoin', style: TextStyle(fontSize: 30),)
            ]),
      ),
    );
  }
}
