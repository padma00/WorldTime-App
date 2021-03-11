import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {
  String location; //location of which want to find time
  String time; //time at that location
  String flag; //url for the asset flag
  String url; //location url for api endpoint
  bool isday; // true if it is day false if it is night

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    try {
      Response response =
          await get('https://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      String datetime = data['datetime'];
      String offset1 = data['utc_offset'].substring(1, 3);
      String offset2 = data['utc_offset'].substring(4, 6);

      DateTime now = DateTime.parse(datetime);
      now = now.add(
          Duration(hours: int.parse(offset1), minutes: int.parse(offset2)));

      isday = now.hour > 5 && now.hour < 19 ? true : false;
      //use of intl package
      time = DateFormat.jm().format(now);
    } catch (e) {
      print('caught an error: $e');
      time = 'error is there';
    }
  }
}
