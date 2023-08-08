import 'package:bmi/login/login.dart';
import 'package:bmi/pages/result.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  int cindex = 0;
  double height = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff001c30),
      appBar: AppBar(
        leading: null,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout_sharp),
            onPressed: () {
              logout(context);
            },
          ),
        ],
        elevation: 0,
        backgroundColor: const Color(0xff001c30),
        centerTitle: true,
        title: const Text('BMI Calculator'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ///gender
              const SizedBox(height: 50),

              Row(
                children: [
                  gender('man', const Color(0xff176b87), 1),
                  gender('woman', Colors.pink, 0),
                ],
              ),
              const SizedBox(height: 50),

              ///height
              heightIndicator(height),
              const SizedBox(height: 50),

              /// age & weight
              Row(
                children: [
                  ageIndicator(),
                  weightIndicator(),
                ],
              ),
              const SizedBox(height: 50),

              /// calculate btn
              button(),
            ],
          ),
        ),
      ),
    );
  }

  void change(int index) {
    setState(() {
      cindex = index;
    });
  }

  Widget gender(String value, Color color, int index) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12),
        height: 80,
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: cindex == index ? color : Colors.grey[200],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: () {
            change(index);
          },
          child: Text(
            value,
            style: TextStyle(
              color: cindex == index ? Colors.white : color,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  double value = 170;
  Widget heightIndicator(double height) {
    double w = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      width: w,
      height: 150,
      decoration: BoxDecoration(
        color: const Color(0xff64ccc5),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          const SizedBox(height: 20),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Height',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '(cm)',
                style: TextStyle(
                  fontSize: 9,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            value.round().toString(),
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          Slider(
            activeColor: const Color(0xff176b87),
            inactiveColor: Colors.white,
            value: value,
            min: 120,
            max: 230,
            divisions: 400,
            onChanged: (newValue) {
              value = newValue;

              setState(() {});
            },
          ),
        ],
      ),
    );
  }

  void logout(BuildContext context) async {
    try {
      await auth.signOut();

      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const LoginPage()));
    } catch (e) {}
  }

  int age = 24;
  Widget ageIndicator() {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12),
        height: 100,
        width: 80,
        decoration: BoxDecoration(
          color: const Color(0xff64ccc5),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            const Text(
              'age',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              age.toString(),
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 3.5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: FloatingActionButton.small(
                    onPressed: () {
                      setState(() {
                        age++;
                      });
                    },
                    backgroundColor: const Color(0xff176b87),
                    foregroundColor: Colors.white,
                    child: const Icon(Icons.add),
                  )),
                  const SizedBox(width: 90),
                  Expanded(
                      child: FloatingActionButton.small(
                    onPressed: () {
                      setState(() {
                        age--;
                      });
                    },
                    backgroundColor: const Color(0xff176b87),
                    foregroundColor: Colors.white,
                    child: const Icon(Icons.remove),
                  )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  double weight = 70;
  Widget weightIndicator() {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12),
        height: 100,
        width: 80,
        decoration: BoxDecoration(
          color: const Color(0xff64ccc5),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            const Text(
              'Weight',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              weight.toString(),
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 3.5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: FloatingActionButton.small(
                    onPressed: () {
                      setState(() {
                        weight++;
                      });
                    },
                    backgroundColor: const Color(0xff176b87),
                    foregroundColor: Colors.white,
                    child: const Icon(Icons.add),
                  )),
                  const SizedBox(width: 90),
                  Expanded(
                      child: FloatingActionButton.small(
                    onPressed: () {
                      setState(() {
                        weight--;
                      });
                    },
                    backgroundColor: const Color(0xff176b87),
                    foregroundColor: Colors.white,
                    child: const Icon(Icons.remove),
                  )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  double calculate(double weight, double height) {
    double heightm = height / 100;
    double bmi = (weight / (heightm * heightm));

    return bmi;
  }

  Widget button() {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Center(
      child: SizedBox(
        height: h * 0.1,
        width: w * 0.5,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff176b87),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          onPressed: () {
            double res = calculate(weight, value);

            Navigator.of(context).push(MaterialPageRoute(
                builder: ((context) => Result(
                      bmi: res,
                      weight: weight,
                      height: value,
                    ))));
          },
          child: const Text('Calculate'),
        ),
      ),
    );
  }
}
