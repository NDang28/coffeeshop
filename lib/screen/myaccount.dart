// ignore_for_file: deprecated_member_use

import 'package:coffeeshop/main.dart';
import 'package:flutter/material.dart';

class MyAccount extends StatelessWidget {
  const MyAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0.0,
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 100,
            width: 100,
            child: Stack(
              fit: StackFit.expand,
              overflow: Overflow.visible,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/account.png'),
                  //radius: 50,
                ),
                Positioned(
                  right: -5,
                  bottom: -5,
                  child: SizedBox(
                    height: 35,
                    width: 35,
                    child: FlatButton(
                      onPressed: () {},
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Icon(Icons.edit),
                      color: Color.fromARGB(255, 161, 161, 161),
                    ),
                  ),
                )
              ],
            ),
          ),

          Container(
            height: 40,
            width: 280,
            margin: EdgeInsets.only(top: 20.0),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  spreadRadius: 3,
                  blurRadius: 10,
                  color: Colors.black.withAlpha(50),
                )
              ],
              borderRadius: BorderRadius.circular(20),
              color: Colors.white
            ),
            child: Center(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 12),
                child: FittedBox(
                  child: Text(
                    "Name",
                    style: TextStyle(fontSize: 17),
                  ),
                ),
              ),
            ),
          ),

          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 25),
              //height: 500,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(25),
                      topLeft: Radius.circular(25))),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ProfileMenu(
                      icon: "assets/images/icons/accin4.png",
                      text: "Account Information",
                      press: () {},
                    ),
                    ProfileMenu(
                      icon: "assets/images/icons/map.png",
                      text: "Location",
                      press: () {},
                    ),
                    ProfileMenu(
                      icon: "assets/images/icons/trolley.png",
                      text: "My Orders",
                      press: () {},
                    ),
                    ProfileMenu(
                      icon: "assets/images/icons/coupon.png",
                      text: "My Coupon",
                      press: () {},
                    ),
                    ProfileMenu(
                      icon: "assets/images/icons/supportservice.png",
                      text: "Help",
                      press: () {},
                    ),
                    ProfileMenu(
                      icon: "assets/images/icons/logout.png",
                      text: "Log Out",
                      press: () {},
                    ),
                    SizedBox(
                      height: 40.0,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
    required this.text,
    required this.icon,
    required this.press,
  }) : super(key: key);

  final String text, icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 20, right: 20, left: 20),
        child: FlatButton(
          padding: EdgeInsets.all(15),
          onPressed: () {
            press();
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          color: Color.fromARGB(255, 219, 218, 218),
          child: Row(
            children: [
              SizedBox(width: 10.0),
              Image.asset(
                icon,
                height: 30,
                width: 30,
              ),
              SizedBox(width: 20.0),
              Expanded(
                  child: Text(
                text,
                style: TextStyle(fontSize: 18),
              )),
              Icon(Icons.arrow_forward_ios)
            ],
          ),
        ));
  }
}
