import 'package:flutter/material.dart';

advices(bmi, weight, height) {
  double heightm = height / 100;
  double underweight = (18.5 * heightm * heightm) - weight;
  double maxover = weight - (25 * heightm * heightm);
  double maxobese = weight - (30 * heightm * heightm);

  if (bmi < 18.5) {
    //underweight
    return Column(
      children: [
        const Text(
          "1) Balanced diet: Focus on nutrient-dense foods that provides vitamins, minerals, healthy fats. fruits, vegetables, whole grains, lean proteins",
          style: TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 10),
        const Text(
          "2) Try to eat several small, frequent meals throughout the day to increase calorie intake.",
          style: TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 10),
        const Text(
          "3) Limit high-fiber foods: it can make you feel full quickly and may interfere with weight gain efforts",
          style: TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 10),
        const Divider(thickness: 2, color: Colors.black),
        const Text(
          "Minimum Weight To Gain To Reach Normal Level Is :",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
        Text(
          underweight.toStringAsPrecision(2),
          style: const TextStyle(
              fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
        )
      ],
    );
  } else if (18.5 <= bmi && bmi < 24.9) {
    //normal
    return const Column(
      children: [
        Text(
          "1) Balanced diet: Continue to focus on a balanced and nutritious diet, including fruits, vegetables, whole grains, lean proteins, and healthy fats.",
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(height: 10),
        Text(
          "2) Monitor portion sizes: Be mindful of portion sizes to prevent overeating, and avoid excessive consumption of processed and high-calorie foods.",
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(height: 10),
        Text(
          "3) Regular exercise: Engage in regular physical activity to maintain your weight",
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(height: 10),
        Divider(thickness: 2, color: Colors.black),
      ],
    );
  } else if (25 < bmi && bmi < 29.9) {
    //overweight
    return Column(
      children: [
        const Text(
          "1) Regular exercise: Engage in a combination of aerobic exercises and strength training to burn calories and build muscle.",
          style: TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 10),
        const Text(
          "2) Lifestyle changes: Incorporate more physical activity into your daily routine, such as walking or cycling instead of driving",
          style: TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 10),
        const Text(
          "3) Set realistic goals: Gradual weight loss (about 1-2 pounds per week) is more sustainable and healthier than rapid weight loss.",
          style: TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 10),
        const Divider(thickness: 2, color: Colors.black),
        const Text(
          "Minimum Weight To lose To Reach Normal Level Is :",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
        Text(
          maxover.toStringAsPrecision(2),
          style: const TextStyle(
              fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
        )
      ],
    );
  } else if (bmi > 30) {
    //obese
    return Column(
      children: [
        const Text(
          "1) Medical evaluation: Consult a healthcare professional for a comprehensive evaluation and personalized weight management plan.",
          style: TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 10),
        const Text(
          "2) Diet modifications: Focus on a balanced and reduced-calorie diet to achieve gradual weight loss. Avoid crash diets or extreme calorie restrictions.",
          style: TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 10),
        const Text(
          "3) Behavioral changes: Identify and address any emotional or psychological factors that may contribute to overeating or unhealthy eating habits.",
          style: TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 10),
        const Divider(thickness: 2, color: Colors.black),
        const Text(
          "Minimum Weight To Lose To Reach Normal Level Is :",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
        Text(
          maxobese.toStringAsPrecision(2),
          style: const TextStyle(
              fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
        )
      ],
    );
  }
}
