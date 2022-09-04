import 'package:flutter/material.dart';

class ListView1Screen extends StatelessWidget {

  final  heroes = const['Aquaman', 'Superman', 'Batman', 'Flash', 'Spiderman'];

  const ListView1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('ListView1'),
      ),
      body: ListView(
        children:  <Widget>[
          ...heroes.map((hero) => ListTile(
            title: Text(hero),
            leading: const Icon(Icons.sports_volleyball_sharp),
            trailing: const Icon(Icons.keyboard_arrow_right),
          )).toList(),

          ]
      )
    );
  }
}
