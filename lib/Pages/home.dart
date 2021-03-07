import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    // taking all data from arguments arrived from loading page
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    print(data);
    String bgimg = data['isday'] ? 'AM.jpg' : 'PM.jpg';
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/$bgimg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 250.0, 0.0, 0.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    data['location'],
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Text(
                data['time'],
                style: TextStyle(
                  fontSize: 66.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              FlatButton.icon(
                onPressed: () async {
                  dynamic result =
                      await Navigator.pushNamed(context, '/location');
                  setState(() {
                    data = {
                      'time': result['time'],
                      'flag': result['flag'],
                      'location': result['location'],
                      'isday': result['isday'],
                    };
                  });
                },
                icon: Icon(
                  Icons.edit_location,
                  color: Colors.grey[50],
                ),
                label: Text('Edit Location',
                    style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
