import 'package:flutter/material.dart';

class InfoForm extends StatefulWidget {
  @override
  _InfoFormState createState() => _InfoFormState();
}

class _InfoFormState extends State<InfoForm> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Text(
            'Info Seminar',
            style: TextStyle(fontSize: 18.0),
          ),
          SizedBox(height: 20.0),
          Text('Nama Acara = Seminar Pak Riky'),
          SizedBox(height: 20.0),
          Text('Waktu = 13:00 WIB'),
        ],
      )
      
    );
  }
}