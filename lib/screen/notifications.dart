import 'package:flutter/material.dart';

import '../main.dart';
import 'home.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              icon: Icon(Icons.arrow_back)),
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Container(
            height: 40.0,
            margin: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5), //color of shadow
                  spreadRadius: 1, //spread radius
                  blurRadius: 10, // blur radius
                  offset: Offset(0, 2), // changes position of shadow
                  //first paramerter of offset is left-right
                  //second parameter is top to down
                ),
              ],
              //border: Border.all(color: Colors.black),
              color: Colors.white,
              borderRadius: BorderRadius.circular(32),
            ),
            child: InkWell(
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 10,
                    ),
                    Icon(Icons.search),
                    Text(
                      ' Would do you like something...',
                      style: TextStyle(
                        color: Colors.grey.shade400,
                        fontWeight: FontWeight.w900,
                        fontSize: 15,
                      ),
                    )
                  ]),
              onTap: () {
                showSearch(
                  context: context,
                  delegate: MySearch(),
                );
              },
            ),
          ),
          bottom: TabBar(
            tabs: [
              Tab(
                  // ignore: prefer_const_literals_to_create_immutables
                  child: Row(children: [
                const Icon(Icons.delivery_dining),
                const SizedBox(
                  width: 5.0,
                ),
                const Text(
                  "Delivery",
                  style: TextStyle(fontSize: 15.0),
                )
              ], mainAxisAlignment: MainAxisAlignment.center)),
              Tab(
                  child: Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Icon(Icons.newspaper),
                  const SizedBox(
                    width: 5.0,
                  ),
                  const Text(
                    "News",
                    style: TextStyle(fontSize: 15.0),
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              )),
            ],
            isScrollable: false,
            indicatorColor: Color.fromARGB(255, 38, 173, 54),
            labelColor: Colors.green,
            unselectedLabelColor: Colors.black,
          ),
        )));
  }
}
