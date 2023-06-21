import 'package:bmi_1/constants.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  BottomButton({super.key, required this.onTap,required this.buttonTitle});
  final Function() onTap;
  final String buttonTitle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: const Color(0xFFEB1555),
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.only(bottom: 10,),
        width: double.infinity,
        height: 80,
        child:  Center(child:
        Text(
          buttonTitle,
          style: kLargeButtonTextStyle,)),
      ),
    );
  }
}
