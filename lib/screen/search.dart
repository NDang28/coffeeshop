//import 'dart:html';

import 'package:coffeeshop/main.dart';
import 'package:coffeeshop/screen/Menu/all.dart';
import 'package:coffeeshop/screen/Menu/bakery.dart';
import 'package:coffeeshop/screen/Menu/coffeebag.dart';
import 'package:coffeeshop/screen/Menu/drinks.dart';
import 'package:coffeeshop/screen/Menu/snack.dart';
import 'package:coffeeshop/screen/Menu/teabox.dart';
import 'package:coffeeshop/screen/home.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          leading:IconButton(onPressed: (){
            Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
          }, icon: Icon(Icons.arrow_back)),
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
                  onTap: (){
                    showSearch(
                      context: context,
                      delegate: MySearch(),
                    );
                  },
            ),
          ),
          bottom: TabBar(
            tabs: [
              Tab(text: "All"),
              Tab(text: "Drinks"),
              Tab(text: "Coffee"),
              Tab(text: "Tea"),
              Tab(text: "Bakery"),
              Tab(text: "Snack"),
            ],
            isScrollable: true,
            indicatorColor: Color.fromARGB(255, 9, 133, 23),
          ),
        ),
        body: TabBarView(children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 10.0),
                Container(
                  height: MediaQuery.of(context).size.shortestSide + 650,
                  child: All(),
                )
              ],
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 10.0),
                Container(
                  height: MediaQuery.of(context).size.height + 1030,
                  child: Drinks(),
                )
              ],
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 10.0),
                Container(
                  height: MediaQuery.of(context).size.height + 20,
                  child: Coffee(),
                )
              ],
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 10.0),
                Container(
                    height: MediaQuery.of(context).size.height + 270,
                    child: Tea())
              ],
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 10.0),
                Container(
                    height: MediaQuery.of(context).size.height + 20,
                    child: Bakery())
              ],
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 10.0),
                Container(
                    height: MediaQuery.of(context).size.height - 250,
                    child: Snack())
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
