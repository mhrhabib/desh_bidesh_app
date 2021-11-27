import 'package:flutter/material.dart';

class CounterAnimator extends StatefulWidget {
  const CounterAnimator({Key? key}) : super(key: key);

  @override
  _CounterAnimatorState createState() => _CounterAnimatorState();
}

class _CounterAnimatorState extends State<CounterAnimator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> animation;
  int counter = 0;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    animation = Tween(begin: 0.0, end: 8.0).animate(_controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse(from: 5.0);
        } else if (status == AnimationStatus.reverse) {
          //_controller.repeat();
        }
      })
      ..addListener(() {
        setState(() {
          debugPrint('${animation.value}');
        });
      });
    //animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    _controller.addListener(() {
      setState(() {
        counter++;
        debugPrint('print $counter');
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          child: animation.value < 5
              ? Text(
                  _controller.isAnimating
                      ? counter.toStringAsFixed(2)
                      : "Lets Begin",
                  style: TextStyle(fontSize: 24.0 * animation.value + 20.0),
                )
              : Container(
                  height: 100,
                  width: 100,
                  alignment: Alignment.center,
                  color: Colors.amber,
                  child: Text('Completed'),
                ),
          onTap: () {
            _controller.forward(from: 0.0);
          },
        ),
      ),
    );
  }
}
