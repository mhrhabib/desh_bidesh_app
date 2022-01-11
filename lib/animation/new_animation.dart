import 'package:flutter/material.dart';

class NewAnimation extends StatefulWidget {
  const NewAnimation({Key? key}) : super(key: key);

  @override
  _NewAnimationState createState() => _NewAnimationState();
}

class _NewAnimationState extends State<NewAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
