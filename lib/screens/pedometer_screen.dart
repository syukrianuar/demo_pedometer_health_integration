import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pedometer/pedometer.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:intl/intl.dart';

class PedometerScreen extends StatefulWidget {
  const PedometerScreen({super.key});

  @override
  State<PedometerScreen> createState() => _PedometerScreenState();
}


class _PedometerScreenState extends State<PedometerScreen> {
  late Stream<StepCount> _stepCountStream;
  late Stream<PedestrianStatus> _pedestrianStatusStream;
  late String _status = '';
  late int _totalSteps = 0;
  late int _steps = 0;
  late String _displaySteps = '';
  late DateTime _timeStamp = DateTime.now();
  late String _resetTime;
  // late String a = '';

  @override
  void initState() {
    // _stepCountStream;
    // _pedestrianStatusStream;
    // _status;
    // _steps;

    initPlatformState();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  // void onTotalStepCount(StepCount event) {
  //   if (kDebugMode) {
  //     print(event);
  //   }
  //   setState(() {
  //     // a = event.timeStamp.toString();
  //     _totalSteps = event.totalSteps;
  //   });
  // }

  void onStepCount(StepCount event) {
    if (kDebugMode) {
      print(event);
    }
    setState(() {
      _timeStamp = event.timeStamp;
      _resetTime = DateFormat.Hms().format(_timeStamp);
      _steps = event.steps;
      if (_resetTime == '18:00:00') {
        //  _totalSteps = event.totalSteps;
        _totalSteps = _totalSteps + _steps;
      }
      _displaySteps = (_totalSteps - _steps).toString();
    });
  }

  void onPedestrianStatusChanged(PedestrianStatus event) {
    if (kDebugMode) {
      print(event);
    }
    setState(() {
      _status = event.status;
    });
  }

  void onPedestrianStatusError(error) {
    if (kDebugMode) {
      print('onPedestrianStatusError: $error');
    }
    setState(() {
      _status = 'Pedestrian Status not available';
    });
    if (kDebugMode) {
      print(_status);
    }
  }

  void onStepCountError(error) {
    if (kDebugMode) {
      print('onStepCountError: $error');
    }
    setState(() {
      _displaySteps = 'Step Count not available';
    });
  }

  Future<void> initPlatformState() async {
    if (await Permission.activityRecognition.request().isGranted) {
      _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
      _stepCountStream = Pedometer.stepCountStream;
      _stepCountStream.listen(onStepCount).onError(onStepCountError);
      _pedestrianStatusStream
          .listen(onPedestrianStatusChanged)
          .onError(onPedestrianStatusError);

      if (kDebugMode) {
        print(_steps);
        print(_status);
      }
    } else {
      if (kDebugMode) {
        print('Tidak dibenarkan');
      }
    }
    // if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Pedometer example app'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Steps taken at:',
                style: TextStyle(fontSize: 30),
              ),
              Text(
                _timeStamp.toString(),
                style: const TextStyle(fontSize: 20),
              ),
              const Divider(
                height: 100,
                thickness: 0,
                color: Colors.white,
              ),
              const Text(
                'Steps taken:',
                style: TextStyle(fontSize: 30),
              ),
              Text(
                _displaySteps.toString(),
                style: const TextStyle(fontSize: 60),
              ),
              const Divider(
                height: 100,
                thickness: 0,
                color: Colors.white,
              ),
              const Text(
                'Pedestrian status:',
                style: TextStyle(fontSize: 30),
              ),
              Icon(
                _status == 'walking'
                    ? Icons.directions_walk
                    : _status == 'stopped'
                        ? Icons.accessibility_new
                        : Icons.error,
                size: 100,
              ),
              Center(
                child: Text(
                  _status,
                  style: _status == 'walking' || _status == 'stopped'
                      ? const TextStyle(fontSize: 30)
                      : const TextStyle(fontSize: 20, color: Colors.red),
                ),
              ),
              // ElevatedButton(onPressed: () {}, child: Text('Start'))
            ],
          ),
        ),
      ),
    );
  }
}
