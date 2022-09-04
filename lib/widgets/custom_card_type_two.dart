import 'package:fl_app/themes/app_theme.dart';
import 'package:flutter/material.dart';

class CustomCardTypeTwo extends StatelessWidget {

  const CustomCardTypeTwo({Key? key, required this.imgPath, this.nameCard}) : super(key: key);

  final String imgPath;
  final String? nameCard;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 4.0,
      shadowColor: AppTheme.primaryColor,
      child: Column(
        children:  [
           FadeInImage(
            image: NetworkImage(imgPath),
            placeholder: const AssetImage('assets/img/loading_pets.gif'),
            width: double.infinity,
            height: 200.0,
            fit: BoxFit.cover,
            fadeInDuration: Duration(milliseconds: 300),
          ),
          if (nameCard != null)
          Container(
            alignment: AlignmentDirectional.centerEnd,

            padding: EdgeInsets.all(10.0),
            child:  Text( nameCard!),
          )
        ],
      ),
    );
  }
}
