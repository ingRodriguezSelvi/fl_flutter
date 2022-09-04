import 'package:flutter/material.dart';

import 'package:fl_app/widgets/widgets.dart';

class CardScreen extends StatelessWidget {

  const CardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('CardScreen'),
        elevation: 0.0,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        children: const [
          CustomCardTypeOne(),
          SizedBox(height: 16.0),
          CustomCardTypeTwo(imgPath: 'https://images.unsplash.com/photo-1561037404-61cd46aa615b?ixlib=rb-1.2.1&w=1080&fit=max&q=80&fm=jpg&crop=entropy&cs=tinysrgb'),
          SizedBox(height: 16.0),
          CustomCardTypeTwo(imgPath: 'https://blog.mystart.com/wp-content/uploads/shutterstock_224423782-1-e1527774744419.jpg'),
          SizedBox(height: 16.0),
          CustomCardTypeTwo(imgPath: 'https://cdn.wallpapersafari.com/19/37/VFsZG2.jpeg'),
          SizedBox(height: 16.0),
          CustomCardTypeTwo(imgPath: 'https://burst.shopifycdn.com/photos/business-pug-working-on-laptop.jpg?width=1200&format=pjpg&exif=1&iptc=1',)
        ],
      )
    );
  }
}
