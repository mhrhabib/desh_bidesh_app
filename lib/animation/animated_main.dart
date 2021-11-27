import 'package:flutter/material.dart';

class AnimatedMain extends StatefulWidget {
  const AnimatedMain({Key? key}) : super(key: key);

  @override
  _AnimatedMainState createState() => _AnimatedMainState();
}

class _AnimatedMainState extends State<AnimatedMain>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 4000));
    animation = CurvedAnimation(parent: controller, curve: Curves.easeInOut)
      ..addListener(() {
        setState(() {
          debugPrint("${controller.value}");
        });
      });

    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animations'),
      ),
      body: Center(
        // child: Image.asset(
        //   'images/nature.png',
        //   fit: BoxFit.cover,
        //   height: 400 * animation.value + 20,
        // ),
        child: Container(
          color: animation.value < 1 ? Colors.amber : Colors.blueAccent,
          child: animation.value < 1
              ? Text(
                  "Hello world",
                  style: TextStyle(fontSize: 30.0 * animation.value + 2),
                )
              : const Text(
                  "Completed",
                  style: TextStyle(fontSize: 30),
                ),
        ),
      ),
    );
  }
}
