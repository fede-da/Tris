import 'package:tris/src/common_widgets/tris/signs.dart';
import 'package:tris/src/handler/tris_handler.dart';

class IAHandler extends TrisHandler {
  IAHandler() {
    setIaSigns();
  }

  List<int> iaSignsOnTris = [];
  late Signs iaSign;
  late Signs enemySign;
  bool isScore = false;

  @override
  void move(void Function(int) f) {
    int smartChoice = ultraSmartAlgorithm();
    iaSignsOnTris.add(smartChoice);
    super.iaCanMove = false;
    print("IA now can't play");
    f(smartChoice);
    return;
  }

  //Qui segue l'algoritmo ultra smart, diviso in fasi
  //1: se esiste un possibile tris avversario questo viene bloccato
  //2: vengono riportati tutti i tris possibili
  //3: tra le possibili soluzioni, se vi sono, si sceglie quella che abilita più tris insieme

  int ultraSmartAlgorithm() {
    int diagonal = getAvaibleDiagonal();
    print("IA is choosing");
    if (super.getMosse() > 7) {
      print("IA chosen $diagonal");
      return diagonal;
    }
    int ia_choice = smartChoice(iaSign);
    if (isScore) {
      print("IA win! So she schooses $ia_choice");
      return ia_choice;
    }
    int elementToStop = checkStop(super.signs[latestChoice]);
    //checks if an element must be stopped
    if (elementToStop != -1) {
      print("IA found enemy tris, stopping at $elementToStop");
      return elementToStop;
    }
    //Make smart choice
    print("IA at the end chooses $ia_choice");
    return ia_choice;
  }

  int smartChoice(Signs sign) {
    int score = tryToScore();
    if (score >= 0) {
      isScore = true;
      return score;
    } else {
      score = getAvaibleDiagonal();
      if (score == -1) {
        return pickRandom();
      }
      return score;
    }
  }

  int tryToScore() {
    int ret = -1;
    iaSignsOnTris.forEach((element) {
      int isTris = ifAvaibleTrisChooseIt(element);
      if (isTris != -1) {
        ret = isTris;
      }
    });
    if (ret == -1) ret = ifAvaibleTrisOnDiagonal();
    return ret;
  }

  int ifAvaibleTrisChooseIt(int index) {
    List<int> temp = super.getColumnIndexes(index);
    if (isTrisAvaibleOn(temp)) {
      return getFirstAvaiblePositionFrom(temp);
    }
    temp = super.getRowIndexes(index);
    if (isTrisAvaibleOn(temp)) {
      return getFirstAvaiblePositionFrom(temp);
    }
    return -1;
  }

  int ifAvaibleTrisOnDiagonal() {
    if (isTrisAvaibleOn(super.diag1)) {
      return getFirstAvaiblePositionFrom(diag1);
    }
    if (isTrisAvaibleOn(super.diag2)) {
      return getFirstAvaiblePositionFrom(diag2);
    }
    return -1;
  }

  bool isTrisAvaibleOn(List<int> toCheck) {
    for (int i = 0; i < 3; i++) {
      print("${signs[toCheck[i]]}");
    }
    int occupied = 0;
    Signs iaSignF = super.signs[iaSignsOnTris[0]];
    for (int element = 0; element < toCheck.length; element++) {
      if (super.signs[toCheck[element]] == iaSignF) {
        occupied++;
      } else if (super.signs[toCheck[element]] ==
          super.signs[super.latestChoice]) {
        return false;
      }
    }
    if (occupied == 2) {
      return true;
    }
    return false;
  }

  int pickRandom() {
    for (int i = 0; i < signs.length; i++) {
      if (signs[i] == Signs.empty) return i;
    }
    return 0;
  }

  bool isCenterAvaible() {
    return super.signs[4] == Signs.empty;
  }

  int getAvaibleDiagonal() {
    int ret = 0;
    if (super.latestChoice == -1) return 0;
    switch (super.latestChoice) {
      case 0:
        ret = 8;
        break;
      case 2:
        ret = 6;
        break;
      case 6:
        ret = 2;
        break;
      case 8:
        ret = 0;
        break;
    }
    if (!super.isEmptyAt(ret)) {
      //Chooses the first empty elemnt on corners
      return [
        super.signs[0],
        Signs.circle,
        super.signs[2],
        Signs.circle,
        Signs.circle,
        Signs.circle,
        super.signs[6],
        Signs.circle,
        super.signs[8]
      ].indexOf(Signs.empty);
    }
    return ret;
  }

  //--------------------------------Stop functions---------------------------------

  int checkStop(Signs enemySign) => stopIfNeeded(
      super.getColumnIndexes(super.latestChoice),
      super.getRowIndexes(super.latestChoice),
      enemySign);

  int stopIfNeeded(List<int> list1, List<int> list2, Signs sign) {
    if (toStop(list1)) {
      return getFirstAvaiblePositionFrom(list1);
    } else if (toStop(list2)) {
      return getFirstAvaiblePositionFrom(list2);
    } else if (toStop([0, 4, 8])) {
      return getFirstAvaiblePositionFrom([0, 4, 8]);
    } else if (toStop([2, 4, 6])) {
      return getFirstAvaiblePositionFrom([2, 4, 6]);
    }
    return -1;
  }

  bool toStop(List<int> listToStop) {
    Signs enemySignF = super.signs[latestChoice];
    Signs iaSignF = super.signs[iaSignsOnTris[0]];
    int occupied = 0;
    int free = 0;
    for (int i = 0; i < listToStop.length; i++) {
      if (super.signs[listToStop[i]] == iaSignF) {
        return false;
      }
      if (super.signs[listToStop[i]] == enemySignF) {
        occupied++;
      } else {
        free++;
      }
    }
    if (occupied == 2 && free == 1) return true;
    return false;
  }

  int getFirstAvaiblePositionFrom(List<int> list) {
    for (int i = 0; i < list.length; i++) {
      if (super.signs[list[i]] == Signs.empty) {
        return list[i];
      }
    }
    for (int i = 0; i < list.length; i++) {
      print(" ${list[i]} ");
    }
    throw Exception("There isn't an avaible position in above list ");
  }

  //----------------- clean section -------------

  void setIaSigns() {
    if (super.iaMovesFirst) {
      iaSign = super.tm.getFirstPlayer().getSign();
      enemySign = super.tm.getSecondPlayer().getSign();
    } else {
      iaSign = super.tm.getSecondPlayer().getSign();
      enemySign = super.tm.getFirstPlayer().getSign();
    }
  }

  void swapIaSigns() {
    Signs temp = iaSign;
    iaSign = enemySign;
    enemySign = temp;
    return;
  }

  @override
  void cleanIa() {
    super.swapFirstMoving();
    swapIaSigns();
    isScore = false;
    return iaSignsOnTris.clear();
  }
}
