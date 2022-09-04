import 'package:flutter/material.dart';

import '../themes/app_theme.dart';

class CustomCardTypeOne extends StatelessWidget {
  const CustomCardTypeOne({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
          children: [
            const ListTile(
              title:Text('Account'),
              subtitle:Text('Account description'),
              leading:Icon(Icons.person, color: AppTheme.primaryColor ),

            ),
            Padding(
                padding: const EdgeInsets.only(right: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: (){},
                        child: const Text('Transfer'),
                    ),
                    TextButton(onPressed: (){}, child: const Text('Pay')),
                  ],
                )
            )
          ],
        )
    );
  }
}
