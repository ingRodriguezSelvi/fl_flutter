import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedScreen extends StatefulWidget {

  const AnimatedScreen({Key? key}) : super(key: key);
 @override
  State<AnimatedScreen> createState() => _AnimatedScreen();
}

double _height = 100;
double _width = 100;
Color _color = Colors.pink;
BorderRadiusGeometry _borderRadiusGeometry = BorderRadius.circular(10);




class _AnimatedScreen extends State<AnimatedScreen> {

  void onChangeShape() {

    final random = Random();
    _height = random.nextInt(300).toDouble() + 70;
    _width = random.nextInt(300).toDouble() + 70;
    _color = Color.fromRGBO(random.nextInt(255), random.nextInt(255), random.nextInt(255), 1);
    _borderRadiusGeometry =  BorderRadius.circular(random.nextInt(100).toDouble() + 10);
    setState((){});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated'),
      ),
      body: Center(
        child: AnimatedContainer(
          width: _width,
          height: _height,
          decoration: BoxDecoration(
            color: _color,
            borderRadius: _borderRadiusGeometry,
          ),
          duration: const Duration(milliseconds:400),
          curve: Curves.easeOutCubic,
        ),
      ),
      floatingActionButton:   FloatingActionButton(
        onPressed:onChangeShape,
        child:const Icon(Icons.play_circle_outline_outlined,size: 35,),
      ),

    );
  }
}


