import 'package:flutter/material.dart';
import '../services/word_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


  void setUpWorldTime() async{
    WorldTime newTimeInstance = WorldTime('Africa/Accra', 'Ghana.png', 'Ghana');
    await newTimeInstance.getTime();
    Navigator.pushReplacementNamed(context, "/home", arguments: {
      'time': newTimeInstance.time,
      'flag': newTimeInstance.flag,
      'location': newTimeInstance.location,
      'isDayTime': newTimeInstance.isDayTime,
    });
//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
  }


  @override
  void initState() {
    super.initState();
    setUpWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: SpinKitCubeGrid(
          color: Colors.white,
          size: 50.0,
        ),
      )
    );
  }
}
