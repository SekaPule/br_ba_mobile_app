import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  var _batteryPercentage;

  static const batteryChannel = const MethodChannel('battery');

  Future<void> getBatteryInformation() async {
    String batteryPercentage;
    try {
      var result = await batteryChannel.invokeMethod('getBatteryLevel');
      batteryPercentage = 'Battery level at $result%';
    } on PlatformException catch (e) {
      batteryPercentage = "Failed to get battery level '${e.message}'.";
    }

    setState(() {
      _batteryPercentage = batteryPercentage;
    });
  }

  @override
  void initState() {
    getBatteryInformation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: [
        Container(
            color: Colors.black,
            child: Column(
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        width: 300,
                      ),
                      Image.asset(
                        "assets/icon.png",
                        scale: 7,
                      ),
                    ],
                  ),
                ),
                ListTile(
                  title: Text(
                    "All Characters",
                    style: TextStyle(color: Colors.green[900]),
                  ),
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, "/allchar", (route) => false);
                  },
                ),
                ListTile(
                  title: Text("Random Characters",
                      style: TextStyle(color: Colors.green[900])),
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, "/randchar", (route) => false);
                  },
                ),
                ListTile(
                  title: Text("Quotes",
                      style: TextStyle(color: Colors.green[900])),
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, "/quotes", (route) => false);
                  },
                ),
                SizedBox(
                  height: 330,
                )
              ],
            )),
        Column(
          children: [
            Row(
              children: [
                Icon(Icons.battery_std),
                Text(_batteryPercentage.toString())
              ],
            )
          ],
        )
      ],
    ));
  }
}
