import 'package:tris/src/common_widgets/tris/signs.dart';
import 'package:tris/src/handler/tris_handler.dart';

class IAHandler extends TrisHandler {
  @override
  void move(void Function(int) f) {
    int smartChoice = ultraSmartAlgorithm();
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
    //super.latestChoice;
    Signs iaSign = super.turns[0].getSign();
    Signs enemySign = super.turns[1].getSign();
    List<List<int>> allEnemyPossibleTris = [];
    List<List<int>> allIAPossibleTris = [];
    print("IA is choosing");
    int elementToStop = checkStop(enemySign);
    //checks if an element must be stopped
    if (elementToStop != -1) {
      print("IA found enemy tris, stopping at $elementToStop");
      return elementToStop;
    }
    //Make smart choice
    int ia_choice = smartChoice();
    print("IA chooses $ia_choice");
    return ia_choice;
  }

  int smartChoice() {
    if (super.getMosse() >= 8) return getAvaibleDiagonal();
    return pickRandom();
  }

  int pickRandom() {
    for (int i = 0; i < signs.length; i++) {
      if (signs[i] == Signs.empty) return i;
    }
    print("There is no room for random choice");
    return 0;
  }

  int getAvaibleDiagonal() {
    switch (super.latestChoice) {
      case 0:
        return 8;
      case 2:
        return 6;
      case 6:
        return 2;
      case 8:
        return 0;
    }
    print("Previous choice is not on diagonal");
    return 0;
  }

  List<List<int>> findAllTrisForSign(Signs sign) {
    List<List<int>> allEnemyTrisAvaible = [];
    List<int> rowIndexes = super.getRowIndexes(super.latestChoice);
    List<int> columnIndexes = super.getColumnIndexes(super.latestChoice);

    return [];
  }

  //--------------------------------Stop functions---------------------------------

  int checkStop(Signs enemySign) => stopIfNeeded(
      super.getColumnIndexes(super.latestChoice),
      super.getRowIndexes(super.latestChoice),
      enemySign);

  int stopIfNeeded(List<int> list1, List<int> list2, Signs sign) {
    if (toStop(list1, sign)) {
      return getFirstAvaiblePositionFrom(list1);
    } else if (toStop(list2, sign)) {
      return getFirstAvaiblePositionFrom(list2);
    } else if (toStop([0, 4, 8], sign)) {
      return getFirstAvaiblePositionFrom([0, 4, 8]);
    } else if (toStop([2, 4, 6], sign)) {
      return getFirstAvaiblePositionFrom([2, 4, 6]);
    }
    return -1;
  }

  bool toStop(List<int> listToStop, Signs enemySign) {
    int enemySquares = 0;
    for (int i = 0; i < listToStop.length; i++) {
      if (signs[listToStop[i]] == enemySign) {
        enemySquares++;
      } else if (signs[listToStop[i]] == Signs.empty) {
        continue;
      } else {
        return false;
      }
    }
    if (enemySquares == 2) return true;
    return false;
  }

  int getFirstAvaiblePositionFrom(List<int> list) {
    List<int> ret =
        list.where((element) => super.signs[element] == Signs.empty).toList();
    return ret.isEmpty ? pickRandom() : ret.first;
  }
}
