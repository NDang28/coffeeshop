import 'dart:async';
import 'package:coffeeshop/main.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), ()=> Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Image.asset('assets/images/logo_phuclong.png',height: 350.0,width: 300.0,),
              Text("Fast, Cheap and Benefit", textAlign: TextAlign.center,style: TextStyle(color: Color.fromARGB(255, 43, 118, 45),fontWeight: FontWeight.bold,fontSize: 20,),)
            ],
          ),
          CircularProgressIndicator(
            color: Colors.green,
          )
        ]),
      ),
    );
  }
}