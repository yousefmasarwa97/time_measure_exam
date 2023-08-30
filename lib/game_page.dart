import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';
import 'dart:async';

class GamePage extends StatefulWidget {
  const GamePage({super.key}); 

  @override
  State<GamePage> createState() => _GamePageState();
  
}
bool israinbow=false;
bool isRightarrow=false;
bool isRedarrow=false;

Icon getRandomArrow() {
  Random random = Random();
  int choice = random.nextInt(2);

  // Set the arrow icon based on the chosen choice
  IconData iconData = choice == 0 ? Icons.arrow_back : Icons.arrow_forward;
  Icon res = Icon(
    iconData,
    size: 50,
    color: getRandomRedOrGreenColor(),
  );
  if (choice==1){
    isRightarrow=true;
  }
  else{
    isRightarrow=false;
  }
  return res;
}

Color getRandomRedOrGreenColor() {
  Random random = Random();

  // Generate a random number (0 or 1) to choose between red and green
  int choice = random.nextInt(2);

  // Set the color component values based on the chosen color
  int red = choice == 0 ? 255 : 0;
  int green = choice == 1 ? 255 : 0;
  int blue = 0; // Set blue to 0 for a pure red or green color

  // Create a Color object using the chosen color components
  Color color = Color.fromARGB(255, red, green, blue);
  if(choice==0){
    isRedarrow=true;
  }
  else{
    isRedarrow=false;
  }
  return color;
}

String getRandomPhoto() {
  final List<String> photoAssets = [
    'asserts/images/arrows.jpg',
    'asserts/images/rainbow.jpg'
  ];

  Random random = Random();
  int randomIndex = random.nextInt(photoAssets.length);
  if(randomIndex==1){
    israinbow=true;
  }
  else{
    israinbow=false;
  }
  
  return photoAssets[randomIndex];
}

class _GamePageState extends State<GamePage> {
  bool isButtonPressed = false;
  Timer? longPressTimer;
  //DateTime? startTime;
  Icon randomArrow = getRandomArrow();
  String randomPhoto = getRandomPhoto(); 
  
  int startTime = 0;
  int endTime = 0;

  void _handlePressDown() {
    setState(() {
      startTime = DateTime.now().microsecondsSinceEpoch * 1000;
      print(startTime);
    });
  }
  
  
  void _handlePressUp() {
    setState(() {
      endTime = DateTime.now().microsecondsSinceEpoch * 1000;
      print(endTime);
      int elapsedNanoseconds = endTime - startTime;

      print("response time: $elapsedNanoseconds nanoseconds");
    });
  }
 

  void cancelTimer() {
    longPressTimer?.cancel();
  }

  // void startTimer() {
  //   startTime = DateTime.now();
  //   longPressTimer = Timer(const Duration(seconds: 10), () {
  //     setState(() {
  //       cancelTimer();
  //       DateTime endTime = DateTime.now();
  //       Duration responseTime = endTime.difference(startTime!);
  //       print('Response time: ${responseTime.inMicroseconds} microseconds');
  //       isButtonPressed=false;
  //     });
  //   });
  // }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    if(israinbow && !isRedarrow ){
                      print("wrong answer");
                    }
                    else if(!israinbow && isRightarrow){
                      print("wrong answer");
                    }
                    else{
                      print("correct answer");
                    }
                    _handlePressUp();
                    startTime = 0;
                    endTime = 0;
                    //randomArrow = getRandomArrow();
                    //randomPhoto = getRandomPhoto();
                  });
                },
                child: const Text(""),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(20),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Column(
              children: [
                Expanded(
                  child: GestureDetector(
                     //onTapDown: (_) => _handlePressDown(),
                      onTapUp: (_) => _handlePressUp(),
                      // onTapCancel: () {
                      // setState(() {
                      // startTime = 0;
                      // endTime = 0;
                      // });
                    //},
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(randomPhoto),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: randomArrow,
                  ),
                ),
                Expanded(
                  child: Center(
                    child: ElevatedButton(
                      
                      onPressed: () {},
                      onLongPress: () {
                        setState(() {
                          print("Holding");
                           //startTimer();
                            randomArrow = getRandomArrow();
                            randomPhoto = getRandomPhoto();
                            isButtonPressed = true;
                        });
                      
                      },
                      // isButtonPressed = false,
                      child: const Text("keep holding!"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isButtonPressed?  const Color.fromARGB(240, 208, 19, 225): Colors.grey,
                        padding: const EdgeInsets.all(100),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            // color: Colors.black,
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    if(israinbow && isRedarrow ){
                      print("wrong answer");
                    }
                    else if(!israinbow && !isRightarrow){
                      print("wrong answer");
                    }
                    else{
                      print("correct answer");
                    }
                      _handlePressUp();
                      startTime = 0;
                      endTime = 0;
                     //randomArrow = getRandomArrow();
                     //randomPhoto = getRandomPhoto();
                  });
                },
                child: const Text(""),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(20),
                ),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.black,
    );
  }
}



// import 'package:flutter/material.dart';


// class NanosecondsButtonApp extends StatefulWidget {
//   @override
//   _NanosecondsButtonAppState createState() => _NanosecondsButtonAppState();
// }

// class _NanosecondsButtonAppState extends State<NanosecondsButtonApp> {
 

  

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Nanoseconds Button'),
//         ),
//         body: Center(
//           child: GestureDetector(
           
//             child: Container(
//               padding: EdgeInsets.all(20),
//               color: Colors.blue,
//               child: Text(
//                 'Press and Hold',
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// void main() {
//   runApp(NanosecondsButtonApp());
// }
