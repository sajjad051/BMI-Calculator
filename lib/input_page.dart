// ignore_for_file: prefer_const_constructors

import 'package:bmi_calculator_starter/bottom_button.dart';
import 'package:bmi_calculator_starter/calculator_brain.dart';
import 'package:bmi_calculator_starter/result_page.dart';
import 'package:bmi_calculator_starter/reuseable_card.dart';
import 'package:bmi_calculator_starter/round_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator_starter/IconWidget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constants.dart';

enum Gender { male, female, none }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.none;

  int height = 180;
  int weight = 65;
  int age = 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReUseableCard(
                    onCardClick: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    color: selectedGender == Gender.male
                        ? kactiveCardColor
                        : kinActiveCardColor,
                    cardChild: IconWidget(
                      icon: FontAwesomeIcons.mars,
                      color: Colors.white,
                      label: 'Male',
                    ),
                  ),
                ),
                Expanded(
                  child: ReUseableCard(
                    onCardClick: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    color: selectedGender == Gender.female
                        ? kactiveCardColor
                        : kinActiveCardColor,
                    cardChild: IconWidget(
                      icon: FontAwesomeIcons.venus,
                      color: Colors.white,
                      label: 'Female',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReUseableCard(
              color: kactiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "HEIGHT",
                    style: klabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        '$height',
                        style: kNumberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: klabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF808E98),
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0xFFEB1555).withOpacity(0.12),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        }),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReUseableCard(
                    color: kactiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: klabelTextStyle,
                        ),
                        Text(
                          '$weight',
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReUseableCard(
                    color: kactiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: klabelTextStyle,
                        ),
                        Text(
                          '$age',
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButtonPage(
            buttonTitle: 'CALCULATE YOUR BMI',
            onTap: () {

              CalculatorBrain brain = CalculatorBrain(
                  height: height,
                  weight: weight
              );

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ResultPage(
                  bmiResult: brain.calculateBmi(),
                  resultText: brain.getResult(),
                  interpretation: brain.getInterpretation(),
                )),
              );
            },
          )
        ],
      ),
    );
  }
}
