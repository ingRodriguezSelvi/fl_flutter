import 'package:flutter/material.dart';

class ListView2Screen extends StatelessWidget {

  final  pets = const['Dog', 'Cat','Fish', 'Duck', 'Bird'];


  const ListView2Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('List of Pets'),
        elevation: 0.0,
        backgroundColor: Colors.pinkAccent,
      ),
      body: ListView.separated(
          itemBuilder: (context, index) => ListTile(
            title: Text(pets[index]),
            leading: const Icon(Icons.pets, color: Colors.pinkAccent,),
            trailing: const Icon(Icons.keyboard_arrow_right),
            onTap: (){
              final game = pets[index];
              print(game);
            },
          ),
          separatorBuilder: (_, __) => const Divider() ,
          itemCount: pets.length
      )
    );
  }
}
