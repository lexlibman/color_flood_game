import 'dart:math';
import 'package:color_flood/assets/constants.dart';
import 'package:flutter/widgets.dart';

class GameBrain {
  List numberBoard;
  List<Row> rows = [];
  List<Row> get board => rows;
  int movesCounter = 0;
  late Color chosenColor;

  List kColorList = [
    k1Color,
    k2Color,
    k3Color,
    k4Color,
    k5Color,
    k6Color,
  ];

  GameBrain({this.numberBoard = const []});
  int x = 0;
  int y = 0;

  // Makes game move :)
  void makeMove(int index) {
    chosenColor = kColorList[index];
    if (movesCounter < 30 && !isFilled()) {
      movesCounter++;
    }
    floodFill(numberBoard, x, y, index);
    createBoard();
  }

  // Checks that numberBoard is filled of same digit
  bool isFilled() {
    for (List l in numberBoard) {
      for (int i in l) {
        if (i != numberBoard[0][0]) {
          return false;
        }
      }
    }
    return true;
  }

  void resetGame() {
    movesCounter = 0;
    generateBoard(14);
    createBoard();
  }

  // Flood algorithm
  void floodFillUtil(screen, x, y, prevC, newC) {
    // Base cases
    if (x < 0 || x >= 14 || y < 0 || y >= 14) return;
    if (screen[x][y] != prevC) return;

    // Replace the color at (x, y)
    screen[x][y] = newC;

    // Recur for north, east, south and west
    floodFillUtil(screen, x + 1, y, prevC, newC);
    floodFillUtil(screen, x - 1, y, prevC, newC);
    floodFillUtil(screen, x, y + 1, prevC, newC);
    floodFillUtil(screen, x, y - 1, prevC, newC);
  }

  // It mainly finds the previous color
  // on (x, y) and calls floodFillUtil()
  void floodFill(screen, x, y, newC) {
    var prevC = screen[x][y];
    if (prevC == newC) return;
    floodFillUtil(screen, x, y, prevC, newC);
  }

  // Makes list of rows with colored containers
  void createBoard() {
    rows = [];
    List<Widget> rowOfSquares;

    for (List row in numberBoard) {
      rowOfSquares = [];
      for (int number in row) {
        rowOfSquares.add(Container(
          decoration: BoxDecoration(
              color: kColorList[number],
              border: Border.all(
                width: 25,
                color: kColorList[number],
              )),
          height: 24,
          width: 24,
        ));
      }
      rows.add(Row(
        children: rowOfSquares,
      ));
    }
  }

  // Generates sized list of sized lists with random numbers
  void generateBoard(int size) {
    numberBoard = [];
    var rng = Random();
    numberBoard =
        List.generate(size, (_) => List.generate(size, (_) => rng.nextInt(6)));
  }
}
