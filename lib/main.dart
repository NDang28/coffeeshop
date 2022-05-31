import 'package:coffeeshop/screen/home.dart';
import 'package:coffeeshop/screen/myaccount.dart';
import 'package:coffeeshop/screen/notifications.dart';
import 'package:coffeeshop/screen/search.dart';
import 'package:coffeeshop/screen/splash_screen.dart';
// ignore: unused_import
import 'package:coffeeshop/screen/test.dart';
import 'package:draggable_fab/draggable_fab.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;
  GlobalKey bottomNavigationkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        margin: EdgeInsets.only(
          bottom: 30.0
        ),
        child: DraggableFab(
          securityBottom: 20.0,
          child: FittedBox(
            child: Stack(
              alignment: Alignment(1.4, -1.5),
              children: [
                FloatingActionButton( 
                  onPressed: () {
                    showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (context) {
                          return SafeArea(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Material(
                                  elevation: 1.0,
                                  child: Row(
                                    children: [
                                      const SizedBox(width: 10.0),
                                      const Icon(Icons.shopping_bag,
                                          size: 25, color: Colors.green),
                                      const Text(
                                        "Your cart: ",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const Text(
                                        "0",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const Spacer(),
                                      IconButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          icon: const Icon(
                                            Icons.cancel,
                                            color: Colors.red,
                                            size: 25,
                                          ))
                                    ],
                                  ),
                                ),
                                SizedBox(height: 20),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                          height: 120,
                                          width: 120,
                                          child: Image.asset(
                                            'assets/images/bagempty.png',
                                            fit: BoxFit.cover,
                                          )),
                                    ]),
                                SizedBox(height: 10.0),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: Text(
                                        "Your bag is empty",
                                        style: TextStyle(
                                            fontSize: 20, fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: 100),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children:[
                                  RaisedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Container(
                                      child: const Text("Back",style: TextStyle(color: Colors.white,fontSize: 17.0),),
                                      constraints:
                                        const BoxConstraints(minHeight: 40, maxWidth: 300),
                                      alignment: Alignment.center,
                                    ),
                                  color: Colors.green,
                                )
                                ]
                                ),
                                SizedBox(height: 10.0)
                              ],
                            ),
                          );
                        });
                  },
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  backgroundColor: Colors.green,
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: SizedBox(
                    height: 25,
                    width: 25,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: [BoxShadow(
                        spreadRadius: 1,
                        blurRadius: 5,
                        color: Colors.black.withAlpha(50))]
                      ),
                      child: Center(
                        child: Text("0",style: TextStyle(fontSize: 15,color: Colors.red),),
                      )
                    )
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      //floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: Center(child: _getpage(currentPage)),
      bottomNavigationBar: FancyBottomNavigation(
        inactiveIconColor: Colors.white,
        barBackgroundColor: Colors.green,
        circleColor: Colors.white,
        activeIconColor: Colors.black,
        tabs: [
          TabData(iconData: Icons.home, title: "Home"),
          TabData(iconData: Icons.search, title: "Sreach"),
          TabData(iconData: Icons.notifications_none, title: "Notifications"),
          TabData(iconData: Icons.account_circle, title: "My Account"),
        ],
        initialSelection: 0,
        key: bottomNavigationkey,
        onTabChangedListener: (position) {
          setState(() {
            currentPage = position;
          });
        },
      ),
    );
  }

  _getpage(int page) {
    switch (page) {
      case 0:
        return const Home();
      case 1:
        return const SearchPage();
      case 2:
        return const Notifications();
      case 3:
        return const MyAccount();
    }
  }
}
