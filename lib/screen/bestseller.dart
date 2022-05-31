

import 'package:coffeeshop/screen/Custom/choosebuttoniced.dart';
import 'package:coffeeshop/screen/Custom/choosebuttonsize.dart';
import 'package:coffeeshop/screen/Custom/choosebuttonsugar.dart';
import 'package:coffeeshop/screen/Custom/quantity.dart';
import 'package:coffeeshop/screen/search.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Bestseller extends StatefulWidget {
  const Bestseller({Key? key}) : super(key: key);

  @override
  State<Bestseller> createState() => _BestsellerState();
}

class _BestsellerState extends State<Bestseller> {

  

  @override
  Widget build(BuildContext context) {
    return
        //Container(
        //margin: EdgeInsets.all(10.0),
        //backgroundColor: Color(0xFFFCFAF8),
        //child: Container(
        //padding: EdgeInsets.only(right: 10.0, left: 10.0),
        //width: MediaQuery.of(context).size.width ,
        //height: MediaQuery.of(context).size.height,
        //child:
        GridView.count(
      crossAxisCount: 2,
      primary: false,
      crossAxisSpacing: 10.0,
      mainAxisSpacing: 15.0,
      childAspectRatio: 0.8,
      children: [
        _buildCard('Peach Tea', 2.49,
            'assets/images/menu/drink/peachtea.png', true, context),
        _buildCard('Strawberry Tea', 3.99,
            'assets/images/menu/drink/strawberrytea.png', false, context),
        _buildCard('Iced Chocolate', 4.49,
            'assets/images/menu/drink/icedchocolate.png', false, context),
        _buildCard('Iced Matcha', 5.99,
            'assets/images/menu/drink/icedmatcha.png', false, context),
      ],
    );
    //)
    //);
  }

  _buildCard(String name, double price, String imgPath, bool added, context) {
    return Padding(
      padding:
          const EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3.0,
                blurRadius: 5.0)
          ],
          color: Colors.white,
        ),
        child: Column(children: [
          const SizedBox(
            height: 30,
          ),
          Hero(
              tag: imgPath,
              child: Container(
                  height: 75.0,
                  width: 75.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(imgPath), fit: BoxFit.contain)))),
          const SizedBox(
            height: 7.0,
          ),
          Text(name,
              style: const TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0), fontSize: 14.0)),
          const SizedBox(
            height: 7.0,
          ),
          Text(price.toString(),
              style: const TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0), fontSize: 14.0)),
          const SizedBox(
            height: 7.0,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: ElevatedButton(
                onPressed: () {
                  _bottomSheetOrder(context, name, imgPath, price);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.add_shopping_cart),
                    SizedBox(width: 5.0),
                    Text("Add")
                  ],
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.green, onPrimary: Colors.white)),
          )
        ]),
      ),
    );
  }

  

  Future<void> _bottomSheetOrder(
      context, String name, String imgPath, double price) async {

    final totalprice = Get.put(NumOfItems(),permanent: true);
    final psize = Get.put(PriceSize(),permanent: true);
    //final NumOfItems totalprice = Get.find();
    //final PriceSize psize = Get.find();
    

    showModalBottomSheet(
        
        isScrollControlled: true,
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        builder: (context) {
          // ignore: sized_box_for_whitespace
          return SafeArea(
            //height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const SizedBox(width: 10.0),
                      const Text(
                        "Edit Order",
                        style: TextStyle(
                            fontSize: 25,
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
                  SizedBox(height: 10.0),
                  Row(
                    children: [
                      SizedBox(width: 10.0),
                      Column(
                        children: [
                          Container(
                              height: 100,
                              margin: EdgeInsets.only(bottom: 5.0),
                              child: Image.asset(imgPath)),
                          Text(name, style: TextStyle(fontSize: 17.0)),
                          Text(price.toString(), style: TextStyle(fontSize: 17.0))
                        ],
                      ),
                      Spacer(),
                      Column(
                        //mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              child: Text("Choose Size",
                                  style: TextStyle(
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.bold))),
                          SizedBox(height: 20.0),
                          Row(
                            children: [
                              ChooseSize(),
                            ],
                          )
                        ],
                      ),
                      SizedBox(width: 10.0)
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          child: Text("Choose Iced",
                              style: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold))),
                      SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ChooseIced(),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          child: Text("Choose Sugar",
                              style: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold))),
                      SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ChooseSugar(),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    height: 40,
                    
                    child: Quantity(),
                  ),
                  const SizedBox(height: 20.0),
                  Row(children: [
                    Container(
                      child: Text(
                        "Total:  ",
                        style: const TextStyle(
                            fontSize: 17.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Spacer(),
                    Container(
                        child: Obx(
                          ()=> 
                          Text((totalprice.num*(price+psize.pricesize)).toStringAsFixed(2),
                              style: TextStyle(
                                  fontSize: 17.0, fontWeight: FontWeight.bold)),
                        )
                        ),
                  ]),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RaisedButton(
                        padding: EdgeInsets.all(0.0),
                        onPressed: () {
                          showBottomSheet(context: context, shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),builder: (context){
                              return Scaffold(body: Row(children: [
                                Column(
                                  children: [
                                    Image.asset('assets/images/menu/logo_phuclong.png')
                                  ],
                                )
                              ],) );
                            });
                        },
                        child: Ink(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              Colors.red.shade400,
                              Colors.red.shade200,
                            ]),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Container(
                            child: const Text(
                              "Add to cart",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 17.0),
                            ),
                            constraints: const BoxConstraints(
                                minHeight: 40, maxWidth: 300),
                            alignment: Alignment.center,
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      )
                    ],
                  ),
                  SizedBox(height: 10.0),
                ],
              ),
            ),
          );
        });
  }
}
