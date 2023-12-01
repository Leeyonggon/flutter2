import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app_flutter/data/network.dart';
import 'package:weather_app_flutter/data/my_location.dart';
import 'package:weather_app_flutter/screens/weather_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const apiKey = 'c95b9c47ec4770f0f6f5eed05c2a0814';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  double? latitude3;
  double? longitude3;

  @override
  void initState() {
    //가장 먼저 실행되는 method
    // TODO: implement initState
    super.initState();
    getLocation();
  }

  void getLocation() async {
    myLocation mylocation = myLocation();
    await mylocation.getMyCurrentLocation();
    latitude3 = mylocation.latitude2;
    longitude3 = mylocation.longitude2;
    print(latitude3);
    print(longitude3);

    Network network = Network(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude3&lon=$longitude3&appid=$apiKey&units=metric',
        'https://api.openweathermap.org/data/2.5/air_pollution?lat=$latitude3&lon=$longitude3&appid=$apiKey');
    var weatherData = await network.getJsonData();
    print(weatherData);

    var airData = await network.getAirData();
    print(airData);

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return WeatherScreen(weatherData, airData); // builder는 항상 return값이 있어야함
    }));
  }

  /*void fetchData() async {
    http.Response response = await http.get(Uri.parse(
        'https://samples.openweathermap.org/data/2.5/weather?q=London&appid=b1b15e88fa797225412429c1c50c122a1'));
    if (response.statusCode == 200) {
      String jsonData = response.body;
      var parsing = jsonDecode(jsonData);
      var myJson = parsing['id'];
      print(myJson);
    } else {
      print(response.statusCode);
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Center(
        child: SpinKitHourGlass(
          color: Colors.white,
          size: 80.0,
        ),
      ),
    );
  }
}
