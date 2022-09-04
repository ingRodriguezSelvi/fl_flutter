import 'package:fl_app/themes/app_theme.dart';
import 'package:flutter/material.dart';

import 'package:fl_app/router/app_routes.dart';

class HomeScreen extends StatelessWidget {

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final menuOptions = AppRoutes.menuOptions;
    return  Scaffold(
      appBar: AppBar(
        title: const Text('HomeScreen'),

        elevation: 0.0,
      ),
      body: ListView.separated(
          itemBuilder: (context, index) => ListTile(
            title: Text(menuOptions[index].title),
            leading: Icon(menuOptions[index].icon, color: AppTheme.primaryColor ),
            onTap: (){
              Navigator.pushNamed(context, menuOptions[index].route);
            },
            trailing: const Icon(Icons.chevron_right),
          ),
          separatorBuilder: (_, __) => const Divider() ,
          itemCount: menuOptions.length
      )
    );
  }
}
