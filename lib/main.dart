import 'package:challenge_difficulty_scale_mansour/viewmodel/animatedwidgetcloud.dart';
import 'package:challenge_difficulty_scale_mansour/viewmodel/day_night_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DayNightProvider>(
      create: (_) => DayNightProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyAppState(),
        title: 'Mansour Cloud Animeation',
      ),
    );
  }
}

class MyAppState extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyAppState> {
  bool isNight = true;

  @override
  Widget build(BuildContext context) {
    isNight = Provider.of<DayNightProvider>(context).isNight;
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.lightBlue.shade900, // status bar color
        brightness: Brightness.light, // status bar brightness
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topLeft,
              colors: context.watch<DayNightProvider>().backGroundColors,
            ),
          ),
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: [
              AnimatedCloud(
                hie: size.height * .2,
                wid: size.width * .4,
                top: 10,
                bottom: 400,
                speed: 230,
                left: 100,
                moveToRight: false,
              ),
              AnimatedCloud(
                hie: size.height * .2,
                wid: size.width * .4,
                top: 10,
                bottom: 500,
                speed: 150,
                left: 10,
                moveToRight: false,
              ),
              AnimatedCloud(
                hie: size.height * .3,
                wid: size.width * .15,
                top: 0,
                bottom: 50,
                speed: 130,
                left: 40,
                moveToRight: false,
              ),
              AnimatedCloud(
                hie: size.height * .3,
                wid: size.width * .15,
                top: 0,
                bottom: 50,
                speed: 130,
                left: 40,
                moveToRight: true,
              ),
              AnimatedCloud(
                hie: size.height * .2,
                wid: size.width * .2,
                top: 500,
                bottom: 0,
                speed: 300,
                left: 88,
                moveToRight: true,
              ),
              AnimatedCloud(
                hie: size.height * .3,
                wid: size.width * .3,
                top: 200,
                bottom: 0,
                speed: 140,
                left: 10,
                moveToRight: true,
              ),
              AnimatedCloud(
                hie: size.height * .2,
                wid: size.width * .4,
                top: 500,
                bottom: 0,
                speed: 110,
                left: 65,
                moveToRight: true,
              ),
              Positioned(
                top: size.height * .20,
                left: size.width * .25,
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Provider.of<DayNightProvider>(context, listen: false)
                            .changeAppMode();
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.white60,
                        radius: 90,
                        child: Image(
                          image: AssetImage(
                            'assets/img/oldman.png',
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text(
                        isNight ? 'Night Time' : 'Day Time',
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
