import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';


class WorldTime{
  late String location;
  late String time;
  late String flag;
  late String url;
  late bool isDayTime;

  WorldTime(this.url, this.flag, this.location);

  Future<void> getTime() async {
    // make the request to get the time
    try {
      Response response = await get(Uri.parse('https://worldtimeapi.org/api/timezone/$url'));
      
      // convert the response to a "dictionary like format"(i.e a map)
      Map data = jsonDecode(response.body);
      
      // Get the properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);
      
      // Create a DateTime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours:int.parse(offset)));

      isDayTime = now.hour > 6 && now.hour < 18 ? true:false;

      // Set the time property
      time = DateFormat.jm().format(now);
    } catch (e) {
      time = 'Could not reach our servers';
    }


  }

}
