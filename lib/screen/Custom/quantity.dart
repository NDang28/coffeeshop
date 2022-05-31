// ignore_for_file: deprecated_member_use

import 'package:coffeeshop/screen/bestseller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/*class NumOfItems extends GetxController {
  RxInt num = 1.obs;

  void add() {
    num++;
  }

  void remove() {
    if (num > 1) {
      num--;
    }
  }
}*/

class NumOfItems extends GetxController{
  RxInt num = 1.obs;

  void add() {
    num++;
  }

  void remove() {
    if (num > 1) {
      num--;
    }
  }
}

class Quantity extends StatefulWidget {
  const Quantity({Key? key}) : super(key: key);

  @override
  State<Quantity> createState() => _QuantityState();
}

class _QuantityState extends State<Quantity> {
  
  final numoftiems = Get.put(NumOfItems());
  //final numofitems = Get.put(NumOfItems());
  //String prices = Bestseller().prices;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        quantityBtn(
            icon: Icons.remove,
            press: () {
              //numofitems.remove();
              numoftiems.remove();
            }),
        Container(
          height: 40,
          width: 200,
          alignment: Alignment.center,
          margin: EdgeInsets.only(right: 10, left: 10),
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(
              color: Colors.black,
              //width: 1.0,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Obx(() => Text((numoftiems.num).toString(),
              style: TextStyle(fontSize: 15.0))),
        ),
        quantityBtn(
            icon: Icons.add,
            press: () {
              //numofitems.add();
              numoftiems.add();
            })
      ],
    );
  }

  SizedBox quantityBtn({required IconData icon, required Function press}) {
    return SizedBox(
      height: 30,
      width: 30,
      child: RaisedButton(
        onPressed: () {
          press();
        },
        child: Icon(icon),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        padding: EdgeInsets.zero,
        color: Colors.red.shade400,
        textColor: Colors.white,
      ),
    );
  }
}
