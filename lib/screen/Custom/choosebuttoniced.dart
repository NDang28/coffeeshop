import 'package:flutter/material.dart';

class ChooseIced extends StatefulWidget {
  const ChooseIced({Key? key}) : super(key: key);

  @override
  State<ChooseIced> createState() => _ChooseIcedState();
}

class _ChooseIcedState extends State<ChooseIced> {
  int selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _customRadioBtn('30%', 0),
        const SizedBox(width: 15.0),
        _customRadioBtn('70%', 1),
        const SizedBox(width: 15.0),
        _customRadioBtn('100%', 2),
      ],
    );
  }

  // ignore: unused_element
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
        print(txt);
      },
      child: Text(txt,style: TextStyle(color: selectedIndex == index ? Colors.white : Colors.black),),
      style: OutlinedButton.styleFrom(
        minimumSize: Size(100, 50),
        backgroundColor: selectedIndex == index ? Colors.green : Colors.white,
        side: const BorderSide(width: 1.5, color: Colors.green),
      ),
    );
  }
}
