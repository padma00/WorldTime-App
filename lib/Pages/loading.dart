import 'package:flutter/material.dart';
import 'package:WorldTime/Services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupWorldTime() async {
    WorldTime instance =
        WorldTime(location: 'Kolkata', flag: 'india.png', url: 'Asia/Kolkata');
    await instance.getTime();

    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isday': instance.isday,
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 300.0, 0.0, 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SpinKitDoubleBounce(color: Colors.purple[200], size: 250.0),
              Text(
                'gudgud',
                style: TextStyle(fontSize: 20.0, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.purple[600],
    );
  }
}
