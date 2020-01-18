import 'package:flutter_login/models/brew.dart';
import 'package:flutter_login/screens/home/brew_list.dart';
import 'package:flutter_login/screens/home/info_form.dart';
import 'package:flutter_login/services/auth.dart';
import 'package:flutter_login/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:beacon_broadcast/beacon_broadcast.dart';
import 'package:location_permissions/location_permissions.dart';



class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {

    
    Future<void> initState() async {

     LocationPermissions().requestPermissions();
    
          if (ServiceStatus.enabled != null) {
            BeaconBroadcast()
              .setUUID('39ED98FF-2900-441A-802F-9C398FC199D2')
              .setMajorId(1)
              .setMinorId(100)
              .start();
              print('otw advertising');
            }
          else if (ServiceStatus.disabled != null) {
            print('Turn on Location');
         }
          
     }
    
    initState();

    void _showSettingsPanel() {
      showModalBottomSheet(context: context, builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
          child: InfoForm(),
        );
      });
    }

    return StreamProvider<List<Brew>>.value(
      value: DatabaseService().brews,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text('Binus Attendance'),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('Log out'),
              onPressed: () async {
                await _auth.signOut();
                BeaconBroadcast().stop();
              },
            ),
            FlatButton.icon(
              icon: Icon(Icons.settings),
              label: Text('Info'),
              onPressed: () => _showSettingsPanel(),
            )
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/coffee_bg.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: BrewList()
        ),
      ),
    );
  }
  
}