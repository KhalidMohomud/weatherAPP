import 'package:flutter/material.dart';
import 'package:weather/weather.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  Weather? weather;
  final OpenWeather = WeatherFactory("2aa532d0113ada65deef7e85cd0c77e9");
  String cityname = "";

  getweather() async {
    try {
      weather = await OpenWeather.currentWeatherByCityName(cityname);
      setState(() {});
    } catch (e) {
      print("error $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 135, 190, 235),
        toolbarHeight: 40,
        elevation: 0,
        title: Text(
          'Weather App',
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(22.0),
            child: TextField(
              onChanged: (values) {
                setState(() {
                  cityname = values;
                });
              },
              decoration: InputDecoration(
                hintText: "Search You City",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                suffixIcon: IconButton(
                  onPressed: () async {
                    getweather();
                    await Future.delayed(
                      Duration(seconds: 2),
                    );
                    () {
                      print("hhhh");
                    };

                    print("khalid");
                  },
                  icon: Icon(Icons.search),
                ),
              ),
            ),
          ),
          Expanded(
            child: weather != null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${weather!.temperature!.celsius!.round()}',
                        style: TextStyle(
                          fontSize: 40,
                        ),
                      ),
                      Text(
                        '${weather!.weatherDescription}',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  )
                : SizedBox(),
          )
        ],
      ),
    );
  }
}
