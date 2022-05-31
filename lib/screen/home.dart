// ignore: unused_import
import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:coffeeshop/list/menulist.dart';
import 'package:coffeeshop/main.dart';
import 'package:coffeeshop/screen/Menu/drinks.dart';
import 'package:coffeeshop/screen/bestseller.dart';
import 'package:coffeeshop/screen/search.dart';
// ignore: unused_import
import 'package:coffeeshop/screen/test.dart';
import 'package:coffeeshop/screen/test2.dart';
// ignore: unnecessary_import
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart';
//import 'package:flutter/services.dart';
//import 'package:geocoder/geocoder.dart';
//import 'package:geolocator/geolocator.dart';

import '../list/adlist.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;

  /*late Position _position;
  late StreamSubscription<Position> _streamSubscription;
  late Address _address;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var locationOptions = LocationOptions(accuracy: LocationAccuracy.high,distanceFilter: 10);
    _streamSubscription = Geolocator().getPositionStream(locationOptions).listen((Position position ) { 
      setState(() {
        //print(position);
        _position = position;

        final coordinates = new Coordinates(position.latitude, position.longitude);
        convertCoordinatesToAddress(coordinates).then((value) => _address = value);
      });

    });
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            titleSpacing: 0,
            backgroundColor: Colors.white,
            floating: false,
            automaticallyImplyLeading: false,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                margin: const EdgeInsets.all(8.0),
                child: CarouselSlider.builder(
                    itemCount: adList.length,
                    itemBuilder: (context, index, realIndex) {
                      final adImage = adList[index];
                      return buildImage(adImage, index);
                    },
                    options: CarouselOptions(
                        height: 180,
                        autoPlay: true,
                        enlargeCenterPage: true,
                        enlargeStrategy: CenterPageEnlargeStrategy.height)),
              ),
              centerTitle: false,
              titlePadding: EdgeInsets.zero,
              title: Container(
                height: 30,
                margin: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5), //color of shadow
                      spreadRadius: 1, //spread radius
                      blurRadius: 10, // blur radius
                      offset: const Offset(0, 2), // changes position of shadow
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
                        const Icon(
                          Icons.search,
                          size: 18,
                        ),
                        Text(
                          'Would you like some drink ...',
                          style: TextStyle(
                              color: Colors.grey.shade400,
                              fontWeight: FontWeight.w900,
                              fontSize: 10),
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
            ),
            expandedHeight: 280,
            /*title: Container(
              margin: EdgeInsets.all(8.0),
              child: CarouselSlider.builder(
                  itemCount: adList.length,
                  itemBuilder: (context, index, realIndex) {
                    final adImage = adList[index];
                    return buildImage(adImage, index);
                  },
                  options: CarouselOptions(
                      height: 150,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      enlargeStrategy: CenterPageEnlargeStrategy.height)),
            ),*/
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: InkWell(
                child: Material(
                  elevation: 1.0,
                  // ignore: sized_box_for_whitespace
                  child: Container(
                    height: 40.0,
                    //decoration: BoxDecoration(color: Colors.green),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 18,
                        ),
                        //Container(width: 5,),
                        Icon(Icons.location_on_outlined),
                        const SizedBox(
                          width: 5,
                        ),
                        Flexible(
                          child: Text(
                            "Set your location",
                            //"${_address?.addressLine?? '-'}",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey.shade400,
                                fontWeight: FontWeight.w900),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => testPage2()));
                },
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 100,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: menuList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(10.0),
                            margin: EdgeInsets.only(left: 10, right: 10),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(10)),
                            child: InkWell(
                              child: Image.asset(
                                menuList[index]['iconPath'],
                                height: 50,
                                width: 50,
                              ),
                              onTap: () {
                                final text = "You have added item in cart";
                                final snackbar = SnackBar(content: Text(text),duration: Duration(seconds: 2),);
                                ScaffoldMessenger.of(context).showSnackBar(snackbar);
                                //Navigator.push(
                                //    context,
                                //    MaterialPageRoute(
                                //        builder: (context) => SearchPage()));
                              },
                            ),
                          ),

                          /*SizedBox(
                            height: 10,
                          ),*/
                          Text(
                            menuList[index]['name'],
                            style: TextStyle(color: Colors.black),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    );
                  }),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 35,
              margin: EdgeInsets.all(10),
              child: Row(
                children: [
                  const SizedBox(width: 2.0),
                  const Text(
                    'Best-selling',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.green),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SearchPage()));
                          },
                          child: const Text(
                            "More >>",
                            style: TextStyle(
                                //decoration: TextDecoration.underline,
                                color: Colors.green),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: MediaQuery.of(context).size.shortestSide + 180,
              //width: double.infinity,
              //decoration: BoxDecoration(color: Colors.green),
              child: const Bestseller(),
            ),
          ),
        ],
      ),
    );

    /*return Scaffold(
      appBar: AppBar(
          elevation: 1.0,
          backgroundColor: Colors.green,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 70,
                height: 70,
                child: Image.asset(
                  'assets/images/logo_phuclong_white.png',
                  fit: BoxFit.fill,
                ),
              )
            ],
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(8.0),
              child: CarouselSlider.builder(
                  itemCount: adList.length,
                  itemBuilder: (context, index, realIndex) {
                    final adImage = adList[index];
                    return buildImage(adImage, index);
                  },
                  options: CarouselOptions(
                      height: 150,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      enlargeStrategy: CenterPageEnlargeStrategy.height)),
            ),
            Container(
              height: 30.0,
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
                            fontWeight: FontWeight.w900),
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
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: InkWell(
                child: Material(
                  elevation: 1.0,
                  child: Container(
                    height: 40.0,
                    //decoration: BoxDecoration(color: Colors.green),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 5,
                        ),
                        //Container(width: 5,),
                        Icon(Icons.location_on_outlined),
                        SizedBox(
                          width: 5,
                        ),
                        Flexible(
                          child: Text(
                            "Set your location",
                            //"${_address?.addressLine?? '-'}",
                            style: TextStyle(
                                color: Colors.grey.shade400,
                                fontWeight: FontWeight.w900),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => testPage2()));
                },
              ),
            ),
            Container(
              height: 100,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: menuList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(10.0),
                            margin: EdgeInsets.only(left: 10, right: 10),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(10)),
                            child: InkWell(
                              child: Image.asset(
                                menuList[index]['iconPath'],
                                height: 50,
                                width: 50,
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SearchPage()));
                              },
                            ),
                          ),

                          /*SizedBox(
                            height: 10,
                          ),*/
                          Text(
                            menuList[index]['name'],
                            style: TextStyle(color: Colors.black),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    );
                  }),
            ),
            Container(
              height: 40,
              margin: EdgeInsets.all(10),
              child: Row(
                children: [
                  SizedBox(width: 2.0),
                  Text(
                    'Best-selling',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.green),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "More >>",
                            style: TextStyle(
                                //decoration: TextDecoration.underline,
                                color: Colors.green),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.shortestSide + 150,
              width: double.infinity,
              //decoration: BoxDecoration(color: Colors.green),
              child: Bestseller(),
            ),
          ],
        ),
      ),
    );*/
  }

  Widget buildImage(String adImage, int index) => Container(
        margin: EdgeInsets.symmetric(horizontal: 12),
        color: Colors.grey,
        child: Image.asset(
          adImage,
          fit: BoxFit.fill,
        ),
      );

  /*@override
  void dispose(){
    super.dispose();
    _streamSubscription.cancel();
  }
  Future<Address> convertCoordinatesToAddress(Coordinates coordinates) async{
    var addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
    return addresses.first;
  }*/
}

class MySearch extends SearchDelegate {
  List<String> searchResults = [
    'Tea',
    'Coffee',
    'Cake',
    'Snack',
    'GreenTea',
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            if (query.isEmpty) {
              close(context, null);
            } else {
              query = '';
            }
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
    return null;
  }

  @override
  Widget buildResults(BuildContext context) => Center(
        child: Column(
          children: [
            const SizedBox(height: 200),
            Container(
              child: Image.asset('assets/images/searchnotfound.png'),
              height: 80,
              margin: const EdgeInsets.all(10),
            ),
            const SizedBox(height: 10.0),
            Text.rich(
              TextSpan(
                  text: query,
                  style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.green),
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const TextSpan(
                        text: ' was not found in the category',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.normal))
                  ]),
            ),
            const Text(
              "Please return to home page.",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(height: 10.0),
            RaisedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              child: Text(
                "Home Page",
                style: TextStyle(fontSize: 18,color: Colors.white),
              ),
              color: Colors.green,
              
            )
          ],
        ),
      );

  /*Center(
        child: Text(
          query,
          style: const TextStyle(fontSize: 64, fontWeight: FontWeight.w300,color: Colors.red),
        ),
      );*/

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    List<String> suggestions = searchResults.where((searchResult) {
      final result = searchResult.toLowerCase();
      final input = query.toLowerCase();
      return result.contains(input);
    }).toList();
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final suggestion = suggestions[index];
        return ListTile(
          title: Text(suggestion),
          onTap: () {
            query = suggestion;
          },
        );
      },
    );
  }
}
