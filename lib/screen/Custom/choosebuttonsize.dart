// ignore: unused_import


import 'package:flutter/material.dart';
import 'package:get/get.dart';


class PriceSize extends GetxController{
  double pricesize = 0.0;

  void upload(context){
    pricesize =  context;
  }
}

class ChooseSize extends StatefulWidget {
  

  const ChooseSize({Key? key}) : super(key: key);

  @override
  State<ChooseSize> createState() => _ChooseSizeState();
}

class _ChooseSizeState extends State<ChooseSize> {
  
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _customRadioBtn('M', 0.00, 0),
        
        SizedBox(width: 15.0),

        _customRadioBtn('L', 0.99, 1),
      ],
    );
  }

  _changeIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  _customRadioBtn(String size, double price, int index) {

    final sizep = Get.put(PriceSize());

    return OutlinedButton(
      onPressed: () {
        _changeIndex(index);
        //sizep.upload(price);
        sizep.upload(price);
        print(sizep.pricesize);
      },
      child: Column(
        children: [
          Container(
            child: Text(size,
                style: TextStyle(
                    color:
                        selectedIndex == index ? Colors.white : Colors.black)),
          ),
          SizedBox(height: 5.0),
          Container(
            child: Text(
              price.toString(),
              style: TextStyle(
                  color: selectedIndex == index ? Colors.white : Colors.black),
            ),
          )
        ],
      ),
      style: OutlinedButton.styleFrom(
        minimumSize: Size(100, 50),
        backgroundColor: selectedIndex == index ? Colors.green : Colors.white,
        side: BorderSide(width: 1.5, color: Colors.green),
      ),
    );
  }
}
