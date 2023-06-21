import 'main.dart';
import 'results_page.dart';
import 'package:flutter/material.dart';
import 'package:bmi_1/input_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_1/input_page.dart';
import 'reusable_card.dart';
import 'icon_content.dart';
import 'constants.dart';
import 'package:bmi_1/results_page.dart' hide ResultsPage;
import 'bottom_button.dart';
import 'calculator_brain.dart';


class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  _InputPageState createState() => _InputPageState();
}
enum Gender{
  male,
  female,
}
int height=180;
int weight=60;
int age=18;

class _InputPageState extends State<InputPage> {

  Gender? selectedGender;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('BMI CALCULATOR'),
          backgroundColor: const Color(0xFF0A0E21),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(child: Row(
              children:  [
                Expanded(child: GestureDetector(

                  onTap: (){
                    setState(() {
                      selectedGender=Gender.male;
                    });
                  },

                  child: ReusableCard(
                    colour:selectedGender==Gender.male?cardColor:inactivecardColor,
                    cardChild: const IconContent(icon:FontAwesomeIcons.mars,label:'MALE'),

                  ),
                )),
                Expanded(child: GestureDetector(
                  onTap: (){
                    setState(() {
                      selectedGender=Gender.female;
                    });
                  },

                  child: ReusableCard(
                    colour:selectedGender==Gender.female?cardColor:inactivecardColor,
                    cardChild: const IconContent(icon:FontAwesomeIcons.venus,label:'FEMALE'),

                  ),
                )),
              ],
            )),
            Expanded(child: ReusableCard(colour:cardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:   [
                  const Text(
                    'HEIGHT',
                    style:labelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children:  [
                      Text( height.toString(),
                        style: kNumberTextStyle,
                      ),
                      const Text(
                        'cm',
                        style: labelTextStyle,
                      ),

                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 15),
                          overlayShape: const RoundSliderOverlayShape(overlayRadius: 30 ),
                          thumbColor: const Color(0xFFEB1555),
                          activeTrackColor: const Color(0xFFEB1555),
                          inactiveTrackColor: const Color(0xFF8D8E98),
                        ),
                        child: Slider(

                          value: height.toDouble(),
                          min: 120.0,
                          max: 220.0,


                          onChanged: (double newValue){
                            setState(() {
                              height=newValue.round();
                            });
                          },

                        ),
                      )
                    ],
                  )
                ],
              ),
            )),
            Expanded(child: Row(
              children:  [
                Expanded(child: ReusableCard(colour:cardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  [
                      const Text('WEIGHT',
                        style: labelTextStyle,
                      ),
                      Text(weight.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:    [
                          RoundIconButton(
                            icon:FontAwesomeIcons.plus,
                            onPressed:(){
                              setState(() {
                                weight++;
                              });

                            },


                          ),
                          const SizedBox(width: 10.0),
                          RoundIconButton(
                            icon:FontAwesomeIcons.minus,
                            onPressed: (){
                              setState(() {
                                weight--;
                              });

                            },
                          ),
                        ],
                      )
                    ],
                  ),
                )),
                Expanded(child: ReusableCard(colour:cardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  [
                      const Text('AGE',
                        style: labelTextStyle,
                      ),
                      Text(age.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(icon: FontAwesomeIcons.plus,
                              onPressed: (){
                                setState(() {
                                  age++;
                                });
                              }),
                          const SizedBox(width: 10,),
                          RoundIconButton(icon: FontAwesomeIcons.minus,
                              onPressed: (){
                                setState(() {
                                  age--;
                                });
                              }
                          )
                        ],
                      )
                    ],
                  ),
                )),
              ],
            )),
            BottomButton(buttonTitle: 'CALCULATE',onTap: (){
              CalculatorBrain calc=CalculatorBrain(height: height,weight: weight);
              Navigator.push(context, MaterialPageRoute(builder: (context)=> ResultsPage(
                bmiResults: calc.calculateBMI(),
                resultText: calc.getResult(),
                interpretation: calc.getInterpretation(),
              )));
            },)
          ],
        )

    );
  }
}



class RoundIconButton extends StatelessWidget {


  const RoundIconButton(  {super.key, required this.icon, required this.onPressed});
  final IconData icon;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return  RawMaterialButton(
      onPressed:onPressed,
      constraints: const BoxConstraints.tightFor(
        width:56.0,
        height: 56.0,
      ),
      shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      fillColor: const Color(0xFF4C4F5E),
      child: Icon(icon),

    );
  }
}





