import 'package:flutter/material.dart';
import '../services/word_time.dart';


class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  State<Location> createState() => _LocationState();

}

class _LocationState extends State<Location> {

  List<WorldTime> locations = [
    WorldTime('Africa/Accra', 'Accra.png', 'Accra'),
    WorldTime('Africa/Johannesburg', 'Johannesburg.png', 'Johannesburg'),
    WorldTime('Europe/Lisbon', 'Lisbon.png', 'Lisbon'),
    WorldTime('Europe/Paris', 'Paris.png', 'Paris'),
    WorldTime('Pacific/Tahiti', 'Tahiti.png', 'Tahiti'),
    WorldTime('Asia/Tokyo', 'Tokyo.png', 'Tokyo'),


  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Location"),
        backgroundColor: Colors.blue,
        centerTitle: true,
        elevation: 0,
      ),

      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical:1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
              onTap: (){},
                title: Text(locations[index].location),
            ),
            ),
          );
      },
      ),

    );
  }
}

