import 'package:bmi/pages/advices.dart';
import 'package:flutter/material.dart';

class Result extends StatefulWidget {
  const Result(
      {required this.bmi,
      required this.weight,
      required this.height,
      super.key});
  final double bmi;
  final double weight;
  final double height;
  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xff176b87),
        centerTitle: true,
      ),
      backgroundColor: const Color(0xff176b87),
      body: Container(
        margin: const EdgeInsets.only(top: 35),
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(25.0),
        child: Center(
          child: Column(children: [
            const Text(
              'Your BMI :',
              style: TextStyle(
                fontSize: 25,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            level(widget.bmi),
            const SizedBox(height: 10),
            Text(
              widget.bmi.toStringAsPrecision(3),
              style: const TextStyle(
                fontSize: 25,
                color: Color(0xffdafffb),
                fontWeight: FontWeight.w900,
              ),
              textAlign: TextAlign.center,
            ),
            const Divider(height: 10, thickness: 2, color: Colors.black45),
            const SizedBox(height: 30),
            const Text(
              'You Should Follow Some Of These Advices :',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            advices(widget.bmi, widget.weight, widget.height),
          ]),
        ),
      ),
    );
  }
}

level(bmi) {
  if (bmi < 18.5) {
    return const Text(
      'UNDERWEIGHT',
      style: TextStyle(
        fontSize: 20,
        color: Color(0xffdafffb),
        fontWeight: FontWeight.w900,
      ),
      textAlign: TextAlign.center,
    );
  } else if (18.5 <= bmi && bmi < 24.9) {
    return const Text(
      'NORMAL',
      style: TextStyle(
        fontSize: 20,
        color: Color(0xffdafffb),
        fontWeight: FontWeight.w900,
      ),
      textAlign: TextAlign.center,
    );
  } else if (25 <= bmi && bmi < 29.9) {
    return const Text(
      'OVERWEIGHT',
      style: TextStyle(
        fontSize: 20,
        color: Color(0xffdafffb),
        fontWeight: FontWeight.w900,
      ),
      textAlign: TextAlign.center,
    );
  } else if (bmi > 30) {
    return const Text(
      'OBESE',
      style: TextStyle(
        fontSize: 20,
        color: Color(0xffdafffb),
        fontWeight: FontWeight.w900,
      ),
      textAlign: TextAlign.center,
    );
  }
}
