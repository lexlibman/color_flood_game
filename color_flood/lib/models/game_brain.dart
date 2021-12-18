import 'dart:math';
import 'package:color_flood/assets/constants.dart';
import 'package:flutter/widgets.dart';

class GameBrain with ChangeNotifier {
  List numberBoard;
  List<Row> rows = [];
  List<Row> get board => rows;
  int movesCounter = 0;
  int movesLimit = 30;
  Color chosenColor = k1Color;
  int highScore = 0;
  bool isFilled = false;

  GameBrain({this.numberBoard = const []});
  int x = 0;
  int y = 0;

  // Makes game move :)
  void makeMove(int index) {
    chosenColor = kColorsList[index];

    floodFill(numberBoard, x, y, index);

    if (movesCounter < movesLimit && !isFilled) {
      movesCounter++;
    }
    createBoard();
  }

  // Checks that numberBoard is filled of same digit
  void checkFilled() {
    isFilled = true;
    for (List l in numberBoard) {
      for (int i in l) {
        if (i != numberBoard[0][0]) {
          isFilled = false;
        }
      }
    }
  }

  //Reloads game to the next level with fewer moves limit
  void nextLevel() {
    highScore *= ((movesLimit - movesCounter) + 1);
    movesCounter = 0;
    movesLimit--;
    generateBoard(14);
    createBoard();
    notifyListeners();
  }

  //Restarts game
  void resetGame() {
    movesCounter = 0;
    movesLimit = 30;
    highScore = 0;
    generateBoard(14);
    createBoard();
    notifyListeners();
  }

  // Flood algorithm
  void floodFillUtil(screen, x, y, prevC, newC) {
    // Base cases
    if (x < 0 || x >= 14 || y < 0 || y >= 14) return;
    if (screen[x][y] != prevC) return;

    // Replace the color at (x, y)
    screen[x][y] = newC;

    // Increases game score
    if (!isFilled) {
      highScore++;
    }

    // Recur for north, east, south and west
    floodFillUtil(screen, x + 1, y, prevC, newC);
    floodFillUtil(screen, x - 1, y, prevC, newC);
    floodFillUtil(screen, x, y + 1, prevC, newC);
    floodFillUtil(screen, x, y - 1, prevC, newC);
  }

  // It mainly finds the previous color
  // on (x, y) and calls floodFillUtil()
  void floodFill(screen, x, y, newC) {
    if (movesCounter < movesLimit) {
      var prevC = screen[x][y];
      if (prevC == newC) return;
      floodFillUtil(screen, x, y, prevC, newC);
    }
  }

  // Makes list of rows with colored containers
  void createBoard() {
    checkFilled();
    rows = [];
    List<Widget> rowOfSquares;

    for (List row in numberBoard) {
      rowOfSquares = [];
      for (int number in row) {
        rowOfSquares.add(Container(
          decoration: BoxDecoration(
              color: kColorsList[number],
              border: Border.all(
                width: 25,
                color: kColorsList[number],
              )),
          height: 24,
          width: 24,
        ));
      }
      rows.add(Row(
        children: rowOfSquares,
      ));
    }
    notifyListeners();
  }

  // Generates sized list of sized lists with random numbers
  void generateBoard(int size) {
    numberBoard = [];
    var rng = Random();
    numberBoard =
        List.generate(size, (_) => List.generate(size, (_) => rng.nextInt(6)));
  }
}
