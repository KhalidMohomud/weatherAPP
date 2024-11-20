import 'package:flutter/material.dart';
import 'package:weatherapp/search.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "Image/weap.jpg",
              ),
              fit: BoxFit.cover),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "WellCome to ",
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
              SizedBox(
                height: 14,
              ),
              Container(
                height: 100,
                padding: EdgeInsets.all(22),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  color: Colors.white.withOpacity(0.4),
                ),
                child: Text(
                  "WeatherAPP 🤍🤍🤍",
                  style: TextStyle(
                      fontSize: 34,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.white.withOpacity(0.7),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => Search(),
            ),
          );
        },
        label: Text(
          "Search",
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
