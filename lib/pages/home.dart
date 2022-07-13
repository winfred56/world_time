import 'package:flutter/material.dart';
// import 'loading.dart';
// import 'location.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)?.settings.arguments as Map;
    // print(data);

    String bgImage;
    if (data['isDayTime']) {
      bgImage = 'day1.jpg';
    } else {
      bgImage = 'night.jpg';
    }
    Color bgColor = data['isDayTime'] ? Colors.tealAccent : Colors.indigo;

    return  Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$bgImage'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
              child: Column(
                children: [
                  TextButton.icon(
                      onPressed: ()  {
                        Navigator.pushNamed(context, '/location');
                      },
                      icon: const Icon(Icons.edit_location, color: Colors.black,),
                      label: const Text(
                          "Change Location",
                        style: TextStyle(
                          color: Colors.black
                        ),
                      )),
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        data['location'],
                        style: const TextStyle(
                          fontSize: 28.0,
                          letterSpacing: 1.0,
                          color: Colors.white
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    data['time'],
                    style: const TextStyle(
                      fontSize: 68.0,
                      letterSpacing: 1.0,
                        color: Colors.white
                    ),
                  ),
                ],
              ),
            ),
          ),
      ),
    );
  }
}
