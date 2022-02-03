import 'dart:math';
import 'package:color_flood/assets/constants.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GameData with ChangeNotifier {
  List numberBoard = [];

  List<Row> rows = [];
  List<Row> get board => rows;

  int movesCounter = 0;
  int movesLimit = 30;
  int currentScore = 0;
  int bestScore = 0;

  Color chosenColor = k1Color;

  bool _isFilled = false;
  bool _isSoundOn = true;
  bool _isHapticOn = true;

  bool get isFilled => _isFilled;
  bool get isSoundOn => _isSoundOn;
  bool get isHapticOn => _isHapticOn;

  // Start point coordinates
  int x = 0;
  int y = 0;

  // Makes game move :)
  void makeMove(int index) {
    chosenColor = kColorsList[index];

    floodFill(numberBoard, x, y, index);

    if (movesCounter < movesLimit && !_isFilled) {
      movesCounter++;
    }
    createBoard();
    if (movesCounter >= movesLimit) {
      saveBestScore();
    }
  }

  // Checks that numberBoard is filled of same digit
  void checkFilled() {
    _isFilled = true;
    for (List l in numberBoard) {
      for (int i in l) {
        if (i != numberBoard[0][0]) {
          _isFilled = false;
        }
      }
    }
  }

  //Reloads game to the next level with fewer moves limit
  void nextLevel() {
    currentScore *= ((movesLimit - movesCounter) + 1);
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
    currentScore = 0;
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
    if (!_isFilled) {
      currentScore++;
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

  void toggleSound() async {
    _isSoundOn = !_isSoundOn;
    await SharedPreferences.getInstance().then((prefs) {
      prefs.setBool('isSoundOn', isSoundOn);
    });
    notifyListeners();
  }

  void toggleHaptic() async {
    _isHapticOn = !_isHapticOn;
    await SharedPreferences.getInstance().then((prefs) {
      prefs.setBool('isHapticOn', isHapticOn);
    });
    notifyListeners();
  }

  void loadPreferences() async {
    var prefs = await SharedPreferences.getInstance();
    _isHapticOn = prefs.getBool('isHapticOn') ?? true;
    _isSoundOn = prefs.getBool('isSoundOn') ?? true;
    bestScore = prefs.getInt('bestScore') ?? 0;
  }

  void saveBestScore() async {
    if (currentScore > bestScore) {
      bestScore = currentScore;
      await SharedPreferences.getInstance().then((prefs) {
        prefs.setInt('bestScore', bestScore);
      });
      notifyListeners();
    }
  }
}
