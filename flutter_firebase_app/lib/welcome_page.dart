import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Column(children: [
      Container(
        width: w,
        height: h * 0.3,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("img/signup.png"), fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            SizedBox(
              height: h * 0.16,
            ),
            const CircleAvatar(
              backgroundColor: Colors.white70,
              radius: 60,
              backgroundImage: AssetImage("img/profile1.png"),
            )
          ],
        ),
      ),
      const SizedBox(
        height: 70,
      ),
      Container(
        width: w,
        margin: const EdgeInsets.only(left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Welcome",
              style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54),
            ),
            Text(
              "a@a.com",
              style: TextStyle(fontSize: 18, color: Colors.grey[500]),
            ),
          ],
        ),
      ),
      const SizedBox(height: 200),
      Container(
        width: w * 0.5,
        height: h * 0.08,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          image: const DecorationImage(
              image: AssetImage("img/loginbtn.png"), fit: BoxFit.cover),
        ),
        child: const Center(
          child: Text("Sign out",
              style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
        ),
      ),
    ]));
  }
}
