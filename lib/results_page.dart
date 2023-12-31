import 'package:flutter/material.dart';
import 'constants.dart';
import 'reusable_card.dart';
import 'bottom_button.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage({required this.bmiResults,required this.resultText,required this.interpretation});
  final String bmiResults;
  final String resultText;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
                padding: const EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: const Text('YOUR RESULTS',style: kTitletextStyle,)
            ),
          ),
          Expanded(
            flex: 5,
            child:ReusableCard(colour:cardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:  [
                  Text(resultText.toUpperCase(),style: kResultTextStyle ,),
                  Text(bmiResults,style: kBMITextStyle,),
                  Text(interpretation,
                    style: kBodyTextStyle,
                    textAlign: TextAlign.center,
                  )

                ],
              ),
            ),

          ),
          BottomButton(onTap: (){Navigator.pop(context);}, buttonTitle: 'RECALCULATE')
        ],
      ),
    );
  }
}
