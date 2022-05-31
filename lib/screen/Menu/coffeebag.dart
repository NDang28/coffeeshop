import 'package:flutter/material.dart';

class Coffee extends StatelessWidget {
  const Coffee({Key? key}) : super(key: key);

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
        _buildCard('Cherry Coffee', '\$7.49',
            'assets/images/menu/coffeebag/CoffeeBagCherry.png', false, context),
        _buildCard('Culi Coffee', '\$6.99',
            'assets/images/menu/coffeebag/CoffeeBagCuli.png', false, context),
        _buildCard('Royal Coffee', '\$8.29',
            'assets/images/menu/coffeebag/CoffeeBagRoyal.png', false, context),
        _buildCard('Royal Special Coffee', '\$10.49',
            'assets/images/menu/coffeebag/CoffeeBagRoyalSpecial.png', false, context),
        _buildCard('Smooth Coffee', '\$8.99',
            'assets/images/menu/coffeebag/CoffeeBagSmooth.png', false, context),
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
