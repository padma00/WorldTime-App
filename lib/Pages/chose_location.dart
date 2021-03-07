import 'package:WorldTime/Services/world_time.dart';
import 'package:flutter/material.dart';

class ChoseLocation extends StatefulWidget {
  @override
  _ChoseLocationState createState() => _ChoseLocationState();
}

class _ChoseLocationState extends State<ChoseLocation> {
  List<WorldTime> locationsList = [
    WorldTime(location: 'Kolkata', flag: 'india.png', url: 'Asia/Kolkata'),
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
    WorldTime(url: 'Asia/Tokyo', location: 'Tokyo', flag: 'jap.png'),
    WorldTime(url: 'Australia/Sydney', location: 'Sydney', flag: 'aus.png'),
    WorldTime(url: 'Europe/Zurich', location: 'Switzerland', flag: 'switz.png'),
    WorldTime(url: 'America/Manaus', location: 'Manuas', flag: 'braz.png'),
    WorldTime(url: 'Europe/Rome', location: 'Rome', flag: 'itl.png'),
    WorldTime(url: 'Asia/Dubai', location: 'Dubai', flag: 'uae.png'),
    WorldTime(url: 'Europe/Paris', location: 'Paris', flag: 'france.png'),
  ];
  void updateTime(index) async {
    WorldTime instance = WorldTime(
        location: locationsList[index].location,
        flag: locationsList[index].flag,
        url: locationsList[index].url);
    await instance.getTime();
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isday': instance.isday,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.purple[700],
        title: Text('Chose your Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locationsList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
            ),
            child: Card(
              child: ListTile(
                contentPadding: const EdgeInsets.fromLTRB(8.0, 0.0, 0.0, 0.0),
                onTap: () {
                  updateTime(index);
                },
                title: Text(
                  locationsList[index].location,
                  style: TextStyle(fontSize: 20.0),
                ),
                leading: CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/${locationsList[index].flag}'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
