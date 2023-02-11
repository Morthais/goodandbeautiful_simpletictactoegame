import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // placeholder list to hold the X, O, <empty> values
  List<String> displayXO = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    ''
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // set the background color of the app to grey
        backgroundColor: Colors.purple[400],

        // give the tic-tac-toe game an app bar title
        appBar: AppBar(
          title: const Text('Tic-Tac-Toe'),
          backgroundColor: const Color.fromRGBO(106, 27, 154, 1),
        ),

        // build the tic-tac-toe grid
        body: GridView.builder(
            // set the grid to have 16 boxes and to be 4x4
            padding: const EdgeInsets.all(30),
            itemCount: 16,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, mainAxisExtent: 200),
            itemBuilder: (BuildContext context, int index) {
              // check the grid for a gesture (click, tap, etc.)
              return GestureDetector(
                // change the state of the tapped box
                onTap: () {
                  _tappedBox(index);
                },
                child: Container(
                    // make each the boxes purple with a black border
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(106, 27, 154, 1),
                        border: Border.all(
                          color: Colors.black,
                          width: 2,
                          style: BorderStyle.solid,
                          strokeAlign: BorderSide.strokeAlignOutside,
                        )),
                    child: Center(
                      child: Text(
                        // show the X or O, depending on the _tappedBox method
                        displayXO[index],
                        // set the text to be white and the font to be large
                        style:
                            const TextStyle(color: Colors.white, fontSize: 80),
                      ),
                    )),
              );
            }),
        bottomNavigationBar: const BottomAppBar(
            color: Color.fromRGBO(106, 27, 154, 1),
            child: Text(
              "Instructions: Click once for O, Click twice for X, Click thrice for <blank>.",
              style: TextStyle(color: Colors.white, fontSize: 20),
            )));
  }

  void _tappedBox(int index) {
    setState(() {
      // if empty, then set an O
      // else if O, then set an X
      // else if X, then set an empty
      if (displayXO[index] == '') {
        displayXO[index] = 'O';
      } else if (displayXO[index] == 'O') {
        displayXO[index] = 'X';
      } else if (displayXO[index] == 'X') {
        displayXO[index] = '';
      }
    });
  }
}
