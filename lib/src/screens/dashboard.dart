import 'package:flutter/material.dart';
import 'package:api_nasa/src/utils/color_settings.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('DASHBOARD'),
          backgroundColor: ColorSettings.colorPrimary,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
              ListTile(
              title: Text('Nasa Photos Mars'),
              subtitle: Text('API REST'),
              leading: Icon(Icons.photo_album),
              trailing: Icon(Icons.chevron_right),
              onTap: (){
                Navigator.pop(context);
                Navigator.pushNamed(context,'/photo');
              },
            )
        ],
        ),
      ),
    );
  }
}