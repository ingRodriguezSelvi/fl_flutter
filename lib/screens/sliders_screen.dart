import 'package:fl_app/themes/app_theme.dart';
import 'package:flutter/material.dart';

class SlidersScreen extends StatefulWidget {

  const SlidersScreen({Key? key}) : super(key: key);

  @override
  State<SlidersScreen> createState() => _SlidersScreenState();
}

class _SlidersScreenState extends State<SlidersScreen> {

  double _sliderValue = 100.0;
  bool _blockCheck = false;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Sliders Screen'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Slider.adaptive(
              value: _sliderValue,
              min: 0,
              max: 900,
              activeColor: AppTheme.primaryColor,
              onChanged:_blockCheck
              ?
                  (value) {
                setState(() {
                  _sliderValue = value;
                });
              }
              :
                  null,
            ),
            CheckboxListTile(
                title: const Text('Block Slider'),
                activeColor: AppTheme.primaryColor,
                value: _blockCheck,
                onChanged: ( value ) => setState(() => _blockCheck = value ?? true),
            ),

            SwitchListTile.adaptive(
                title: const Text('Block Slider'),
                activeColor: AppTheme.primaryColor,
                value: _blockCheck,
                onChanged: ( value ) => setState(() => _blockCheck = value ),
            ),

            SingleChildScrollView(
              child: Image(
                image: const NetworkImage( 'https://images3.alphacoders.com/723/thumb-1920-72397.jpg' ),
                fit: BoxFit.contain,width: _sliderValue,),
            )

          ]
        ),
      )
    );
  }
}
