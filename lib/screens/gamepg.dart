import 'package:flutter/material.dart';

class Game_page extends StatefulWidget {
  final player1;
  final player2;
  const Game_page({super.key, required this.player1, required this.player2});

  @override
  State<Game_page> createState() => _Game_pageState();
}

class _Game_pageState extends State<Game_page> {
  int player1_score = 0;
  int player2_score = 0;
  bool win = false;
  bool current_state = true;
  List grid_value = [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "];
  int filled_grid_count = 0;
  Widget build(BuildContext context) {
    var playertext = current_state
        ? '${widget.player1}\'s Turn'
        : '${widget.player2}\'s Turn';

    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * .235,
                    width: MediaQuery.of(context).size.width * .7,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                const Card(
                                  shape: CircleBorder(),
                                  color: Colors.green,
                                  child: Card(
                                      color: Colors.black,
                                      elevation: 20,
                                      shape: CircleBorder(),
                                      child: Icon(
                                        Icons.person,
                                        size: 80,
                                        color: Colors.amber,
                                      )),
                                ),
                                Text(
                                  '${widget.player1}  ( X )',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 0),
                                  child: Text(
                                    player1_score.toString(),
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                const Card(
                                  shape: CircleBorder(),
                                  color: Colors.redAccent,
                                  child: Card(
                                      color: Colors.black,
                                      elevation: 17,
                                      shape: CircleBorder(),
                                      child: Icon(
                                        Icons.person,
                                        size: 80,
                                        color: Colors.amber,
                                      )),
                                ),
                                Text(
                                  '${widget.player2}  ( 0 )',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 0),
                                  child: Text(
                                    player2_score.toString(),
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  Center(
                      child: Text(
                    playertext,
                    style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.amber),
                  )),

                  const SizedBox(
                    height: 10,
                  ),

                  Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 15,
                              mainAxisSpacing: 15),
                      itemCount: 9,
                      itemBuilder: (context, index) {
                        Color itemcolour = grid_value[index] == 'X'
                            ? Colors.green
                            : Colors.red;
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              if (current_state && grid_value[index] == ' ') {
                                grid_value[index] = 'X';
                                filled_grid_count += 1;
                                current_state = !current_state;
                                check_winner();
                              } else if (!current_state &&
                                  grid_value[index] == ' ') {
                                grid_value[index] = '0';
                                filled_grid_count += 1;
                                current_state = !current_state;
                                check_winner();
                              }
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                //color: Colors.white,
                                border:
                                    Border.all(color: Colors.white, width: 1),
                                borderRadius: BorderRadius.circular(30)),
                            child: Center(
                              child: Text(
                                grid_value[index],
                                style: TextStyle(
                                    color: itemcolour,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              restart();
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.amber),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Restart ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black)),
                                Icon(
                                  Icons.restart_alt,
                                  color: Colors.black,
                                  size: 25,
                                )
                              ],
                            )),
                        ElevatedButton(
                            onPressed: () {
                              quit();
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.amber),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Quit  ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                Icon(
                                  Icons.stop_circle_outlined,
                                  color: Colors.black,
                                  size: 25,
                                )
                              ],
                            ))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        )));
  }

  // ignore: non_constant_identifier_names
  check_winner() {
    //checking 1st row
    if (win) {
      setState(() {
        grid_value = [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "];
        current_state = true;
        filled_grid_count = 0;
        win = false;
      });
      //function call for winner popup
    } else if (grid_value[0] == grid_value[1] &&
        grid_value[1] == grid_value[2]) {
      who_win(grid_value[0]);
    }
    //checking 2nd row
    else if (grid_value[3] == grid_value[4] && grid_value[4] == grid_value[5]) {
      who_win(grid_value[3]);
    }
    //checking 3rd row
    else if (grid_value[6] == grid_value[7] && grid_value[7] == grid_value[8]) {
      who_win(grid_value[6]);
    }

    //checking 1st column
    else if (grid_value[0] == grid_value[3] && grid_value[3] == grid_value[6]) {
      who_win(grid_value[0]);
    }
    //checking 2ndcolumn
    else if (grid_value[1] == grid_value[4] && grid_value[4] == grid_value[7]) {
      who_win(grid_value[1]);
    }
    //checking 3rd column
    else if (grid_value[2] == grid_value[5] && grid_value[5] == grid_value[8]) {
      who_win(grid_value[2]);
    }

    //checking 1st diagonal
    else if (grid_value[0] == grid_value[4] && grid_value[4] == grid_value[8]) {
      who_win(grid_value[0]);
    }
    //checking 2nd diagonal
    else if (grid_value[6] == grid_value[4] && grid_value[4] == grid_value[2]) {
      who_win(grid_value[6]);
    } else {
      if (filled_grid_count == 9) {
        showWinPopup(context, 'It\'s a Draw', '');
      }
    }
  }

    //check wether player1 or player 2 is winner
  who_win(value) {
    if (value == 'X') {
      win = true;
      showWinPopup(context, 'Congratulations!', '${widget.player1} Wins!');
      setState(() {
        player1_score += 1;
      });
    } else if (value == '0') {
      win = true;
      showWinPopup(context, 'Congratulations!', '${widget.player2} Wins!');
      setState(() {
        player2_score += 1;
      });
    }
  }

//function to execute when the user restart the game 
  void restart() {
    setState(() {
      player1_score = 0;
      player2_score = 0;
      grid_value = [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "];
      current_state = true;
      filled_grid_count = 0;
      win = false;
    });
  }

//function to execute when the user play the game again
  void playagain() {
    setState(() {
      grid_value = [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "];
      current_state = true;
      filled_grid_count = 0;
      win = false;
    });
  }

//function to execute when the user quit the game
  void quit() {
    Navigator.of(context).pop();
  }

//popup for display a player wins
  void showWinPopup(BuildContext context, String messege, String winner_mgs) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 5.0,
          backgroundColor: Colors.transparent,
          child: Container(
            height: MediaQuery.of(context).size.width * .6,
            width: MediaQuery.of(context).size.width * .8,
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white, // specify border color
                width: 2, // specify border width
              ),
              color: Colors.black,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                  offset: Offset(0.0, 10.0),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Icon(Icons.star, color: Colors.orange, size: 48.0),
                const SizedBox(height: 16.0),
                Text(
                  messege,
                  style: const TextStyle(
                      fontSize: 26.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SizedBox(height: 8.0),
                Text(
                  winner_mgs,
                  style: const TextStyle(
                      fontSize: 20.0,
                      color: Colors.amber,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    playagain();
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Text(
                    'Play again',
                    style: TextStyle(fontSize: 16.0, color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
