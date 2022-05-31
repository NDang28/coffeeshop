import 'package:flutter/material.dart';

class Bakery extends StatelessWidget {
  const Bakery({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      primary: false,
      crossAxisSpacing: 10.0,
      mainAxisSpacing: 15.0,
      childAspectRatio: 0.8,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        _buildCard('Buttercroissant', '\$3.49', 'assets/images/menu/cake/buttercroissant.png', false, context),
        _buildCard('Buttercroissant Chocolate', '\$4.49', 'assets/images/menu/cake/chocobuttercroissant.png', false, context),
        _buildCard('Green Cake', '\$3.99', 'assets/images/menu/cake/GreenCake.png', false, context),
        _buildCard('Passion PannaCotta', '\$2.99', 'assets/images/menu/cake/passionpannacotta.png', false, context),
        _buildCard('Tiramisu Mini', '\$3.49', 'assets/images/menu/cake/tiramisumini.png', false, context),
      ],
    );
  }

  _buildCard(String name, String price, String imgPath, bool added, context) {
    return Padding(
      padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
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
          SizedBox(
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
          SizedBox(
            height: 7.0,
          ),
          Text(name,
              style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0), fontSize: 14.0)),
          SizedBox(
            height: 7.0,
          ),
          Text(price,
              style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0), fontSize: 14.0)),
          SizedBox(
            height: 7.0,
          ),
          Container(
            margin: EdgeInsets.only(left: 20.0, right: 20.0),
            child: ElevatedButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
}