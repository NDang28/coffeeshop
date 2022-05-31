import 'package:flutter/material.dart';

class ChooseSugar extends StatefulWidget {
  const ChooseSugar({Key? key}) : super(key: key);

  @override
  State<ChooseSugar> createState() => _ChooseSugarState();
}

class _ChooseSugarState extends State<ChooseSugar> {
  int selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _customRadioBtn('30%', 0),
        SizedBox(width: 15.0),
        _customRadioBtn('70%', 1),
        SizedBox(width: 15.0),
        _customRadioBtn('100%', 2),
      ],
    );
  }
  
  _changeIndex(int index){
    setState(() {
      selectedIndex = index;
    });
  }
  // ignore: unused_element
  _customRadioBtn(String txt, int index) {
    return OutlinedButton(
      onPressed: () {
        _changeIndex(index);
        
      },
      child: Text(txt,
          style: TextStyle(
              color: selectedIndex == index ? Colors.white : Colors.black)),
      style: OutlinedButton.styleFrom(
        minimumSize: Size(100, 50),
        backgroundColor: selectedIndex == index ? Colors.green : Colors.white,
        side: const BorderSide(width: 1.5, color: Colors.green),
      ),
    );
  }
}
