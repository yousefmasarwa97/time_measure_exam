import 'package:flutter/material.dart';
import 'package:time_measure_2/game_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void click() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) =>
                GamePage())); //go to game page when button is clicked
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: Container(
              color: Colors.black,
              child: const Column(
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                        "Child Name",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        "Is Boy?",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        "Right Handed",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        "Age",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        "Tester Name",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        "KinderGarden Name",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        "Test Type(1-MainTest, 2-Inhibition, 3-Inhibition)",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(""),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.black,
              child: Column(
                children: [
                  const Expanded(
                    child: Center(
                        child: TextField(
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                  const Expanded(
                    child: Center(
                        child: TextField(
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                  const Expanded(
                    child: Center(
                        child: TextField(
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                  const Expanded(
                    child: Center(
                        child: TextField(
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                  const Expanded(
                    child: Center(
                        child: TextField(
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                  const Expanded(
                    child: Center(
                        child: TextField(
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                  const Expanded(
                    child: Center(
                        child: TextField(
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                  Expanded(
                      child: Center(
                          child: TextButton(
                    onPressed: () {
                        click();
                    },
                    child: const Text(
                      'Start',
                      style: TextStyle(color: Colors.white),
                    ),
                  ))),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}



