class PlayedSystem {
  final int howManyFields;
  final int howManyNumbers;

  PlayedSystem({
    this.howManyFields,
    this.howManyNumbers
  });

  static List<List<int>> getDistribution649(int howManyFields, int howManyNumbers) {
    List<List<int>> system = [];

    switch (howManyNumbers) {
      case 6:
        system = System6Of49.sixIn1;
        break;
      case 7:
        switch (howManyFields) {
          case 2:
            system = System6Of49.sevenIn2;
            break;
          case 3:
            system = System6Of49.sevenIn3;
            break;
        }
        break;
      case 8:
        switch (howManyFields) {
          case 3:
            system = System6Of49.eightIn3;
            break;
          case 4:
            system = System6Of49.eightIn4;
            break;
          case 5:
            system = System6Of49.eightIn5;
            break;
          case 6:
            system = System6Of49.eightIn6;
            break;
        }
        break;
      case 9:
        switch (howManyFields) {
          case 5:
            system = System6Of49.nineIn5;
            break;
          case 6:
            system = System6Of49.nineIn6;
            break;
          case 7:
            system = System6Of49.nineIn7;
            break;
          case 8:
            system = System6Of49.nineIn8;
            break;
        }
        break;
      case 10:
        switch (howManyFields) {          
          case 6:
            system = System6Of49.tenIn6;
            break;
          case 7:
            system = System6Of49.tenIn7;
            break;
          case 8:
            system = System6Of49.tenIn8;
            break;
        }
        break;      
    }

    return system;
  }

  static List<List<int>> getDistributionEJ(int howManyFields, int howManyNumbers) {
    List<List<int>> system = [];

    switch (howManyNumbers) {
      case 5:
        system = SystemEuroJackpot.fiveIn1;
        break;
      case 6:
        switch (howManyFields) {
          case 2:
            system = SystemEuroJackpot.sixIn2;
            break;
          
          case 3:
            system = SystemEuroJackpot.sixIn3;
            break;
        }
        break;

      case 7:
        switch (howManyFields) {
          case 3:
            system = SystemEuroJackpot.sevenIn3;
            break;
          case 4:
            system = SystemEuroJackpot.sevenIn4;
            break;
          case 5:
            system = SystemEuroJackpot.sevenIn5;
            break;
          case 6:
            system = SystemEuroJackpot.sevenIn6;
            break;
        }
        break;

      case 8:
        switch (howManyFields) {
          case 4:
            system = SystemEuroJackpot.eightIn4;
            break;
          case 5:
            system = SystemEuroJackpot.eightIn5;
            break;
          case 6:
            system = SystemEuroJackpot.eightIn6;
            break;
          case 7:
            system = SystemEuroJackpot.eightIn7;
            break;
          case 8:
            system = SystemEuroJackpot.eightIn8;
            break;
        }
        break;

      case 9:
        switch (howManyFields) {
          case 6:
            system = SystemEuroJackpot.nineIn6;
            break;
          case 7:
            system = SystemEuroJackpot.nineIn7;
            break;
          case 8:
            system = SystemEuroJackpot.nineIn8;
            break;
        }
        break;

      case 10:
        switch (howManyFields) {          
          case 7:
            system = SystemEuroJackpot.tenIn7;
            break;
          case 8:
            system = SystemEuroJackpot.tenIn8;
            break;
        }
        break;
    }
    return system;
  }
}

abstract class SystemEuroJackpot {
  static List<int> _row05_1 = [1, 1, 1, 1, 1];
  static List<List<int>> fiveIn1 = [_row05_1];
  
  static List<int> _row06_1 = [1, 1, 0, 1, 1, 1];
  static List<int> _row06_2 = [1, 1, 1, 0, 1, 1];
  static List<int> _row06_3 = [1, 1, 1, 1, 0, 1];

  static List<List<int>> sixIn2 = [_row06_1, _row06_2];
  static List<List<int>> sixIn3 = [_row06_1, _row06_2, _row06_3];

  static List<int> _row07_1 = [1, 1, 0, 1, 0, 1, 1];
  static List<int> _row07_2 = [1, 1, 1, 0, 1, 0, 1];
  static List<int> _row07_3 = [1, 1, 1, 1, 0, 1, 0];
  static List<int> _row07_4 = [0, 1, 1, 1, 1, 0, 1];
  static List<int> _row07_5 = [1, 0, 1, 1, 1, 1, 0];
  static List<int> _row07_6 = [0, 1, 0, 1, 1, 1, 1];

  static List<List<int>> sevenIn3 = [_row07_1, _row07_3, _row07_5];
  static List<List<int>> sevenIn4 = [_row07_1, _row07_3, _row07_4, _row07_6];
  static List<List<int>> sevenIn5 = [_row07_1, _row07_2, _row07_4, _row07_5, _row07_6];
  static List<List<int>> sevenIn6 = [_row07_1, _row07_2, _row07_3, _row07_4, _row07_5, _row07_6];  
  
  static List<int> _row08_1 = [1, 0, 1, 1, 0, 1, 0, 1];
  static List<int> _row08_2 = [1, 1, 0, 1, 1, 0, 1, 0];
  static List<int> _row08_3 = [0, 1, 1, 0, 1, 1, 0, 1];
  static List<int> _row08_4 = [1, 0, 1, 1, 0, 1, 1, 0];
  static List<int> _row08_5 = [0, 1, 0, 1, 1, 0, 1, 1];
  static List<int> _row08_6 = [1, 0, 1, 0, 1, 1, 0, 1];
  static List<int> _row08_7 = [1, 1, 0, 1, 0, 1, 1, 0];
  static List<int> _row08_8 = [0, 1, 1, 0, 1, 0, 1, 1];

  static List<List<int>> eightIn4 = [_row08_1, _row08_3, _row08_5, _row08_7];
  static List<List<int>> eightIn5 = [_row08_1, _row08_3, _row08_4, _row08_6, _row08_8];
  static List<List<int>> eightIn6 = [_row08_1, _row08_2, _row08_4, _row08_5, _row08_7, _row08_8];
  static List<List<int>> eightIn7 = [_row08_1, _row08_2, _row08_3, _row08_4, _row08_5, _row08_6, _row08_7];
  static List<List<int>> eightIn8 = [_row08_1, _row08_2, _row08_3, _row08_4, _row08_5, _row08_6, _row08_7, _row08_8];

  static List<int> _row09_1 = [1, 0, 1, 0, 1, 1, 0, 1, 0];
  static List<int> _row09_2 = [0, 1, 0, 1, 0, 1, 1, 0, 1];
  static List<int> _row09_3 = [1, 0, 1, 0, 1, 0, 1, 1, 0];
  static List<int> _row09_4 = [0, 1, 0, 1, 0, 1, 0, 1, 1];
  static List<int> _row09_5 = [1, 0, 1, 0, 1, 0, 1, 0, 1];
  static List<int> _row09_6 = [1, 1, 0, 1, 0, 1, 0, 1, 0];
  static List<int> _row09_7 = [0, 1, 1, 0, 1, 0, 1, 0, 1];
  static List<int> _row09_8 = [1, 0, 1, 1, 0, 1, 0, 1, 0];

  static List<List<int>> nineIn6 = [_row09_1, _row09_2, _row09_4, _row09_5, _row09_7, _row09_8];
  static List<List<int>> nineIn7 = [_row09_1, _row09_2, _row09_3, _row09_4, _row09_5, _row09_6, _row09_7];
  static List<List<int>> nineIn8 = [_row09_1, _row09_2, _row09_3, _row09_4, _row09_5, _row09_6, _row09_7, _row09_8];

  static List<int> _row10_1 = [1, 0, 0, 1, 1, 0, 1, 0, 1, 0];
  static List<int> _row10_2 = [0, 1, 0, 0, 1, 1, 0, 1, 0, 1];
  static List<int> _row10_3 = [1, 0, 1, 0, 0, 1, 1, 0, 1, 0];
  static List<int> _row10_4 = [0, 1, 0, 1, 0, 0, 1, 1, 0, 1];
  static List<int> _row10_5 = [1, 0, 1, 0, 1, 0, 0, 1, 1, 0];
  static List<int> _row10_6 = [0, 1, 0, 1, 0, 1, 0, 0, 1, 1];
  static List<int> _row10_7 = [1, 0, 1, 0, 1, 0, 1, 0, 0, 1];
  static List<int> _row10_8 = [1, 1, 0, 1, 0, 1, 0, 1, 0, 0];  

  static List<List<int>> tenIn7 = [_row10_1, _row10_2, _row10_3, _row10_4, _row10_5, _row10_6, _row10_7];
  static List<List<int>> tenIn8 = [_row10_1, _row10_2, _row10_3, _row10_4, _row10_5, _row10_6, _row10_7, _row10_8]; 
}

abstract class System6Of49 {
  static List<int> _row06_1 = [1, 1, 1, 1, 1, 1];
  static List<List<int>> sixIn1 = [_row06_1];
  
  static List<int> _row07_1 = [1, 1, 0, 1, 1, 1, 1];
  static List<int> _row07_2 = [1, 1, 1, 0, 1, 1, 1];
  static List<int> _row07_3 = [1, 1, 1, 1, 0, 1, 1];

  static List<List<int>> sevenIn2 = [_row07_1, _row07_2];
  static List<List<int>> sevenIn3 = [_row07_1, _row07_2, _row07_3];

  static List<int> _row08_1 = [1, 0, 1, 1, 1, 0, 1, 1];
  static List<int> _row08_2 = [1, 1, 0, 1, 1, 1, 0, 1];
  static List<int> _row08_3 = [1, 1, 1, 0, 1, 1, 1, 0];
  static List<int> _row08_4 = [0, 1, 1, 1, 0, 1, 1, 1];
  static List<int> _row08_5 = [1, 1, 1, 1, 1, 0, 1, 0];
  static List<int> _row08_6 = [0, 1, 1, 1, 1, 1, 0, 1];

  static List<List<int>> eightIn3 = [_row08_1, _row08_3, _row08_5];
  static List<List<int>> eightIn4 = [_row08_1, _row08_3, _row08_4, _row08_6];
  static List<List<int>> eightIn5 = [_row08_1, _row08_2, _row08_4, _row08_5, _row08_6];
  static List<List<int>> eightIn6 = [_row08_1, _row08_2, _row08_3, _row08_4, _row08_5, _row08_6];  
  
  static List<int> _row09_1 = [1, 0, 1, 0, 1, 1, 1, 0, 1];
  static List<int> _row09_2 = [1, 1, 0, 1, 0, 1, 1, 1, 0];
  static List<int> _row09_3 = [0, 1, 1, 0, 1, 0, 1, 1, 1];
  static List<int> _row09_4 = [1, 0, 1, 1, 0, 1, 0, 1, 1];
  static List<int> _row09_5 = [1, 1, 0, 1, 1, 0, 1, 0, 1];
  static List<int> _row09_6 = [1, 1, 1, 0, 1, 1, 0, 1, 0];
  static List<int> _row09_7 = [0, 1, 1, 1, 0, 1, 1, 0, 1];
  static List<int> _row09_8 = [1, 0, 1, 1, 1, 0, 1, 1, 0];
  
  static List<List<int>> nineIn5 = [_row09_1, _row09_3, _row09_4, _row09_6, _row09_8];
  static List<List<int>> nineIn6 = [_row09_1, _row09_2, _row09_4, _row09_5, _row09_7, _row09_8];
  static List<List<int>> nineIn7 = [_row09_1, _row09_2, _row09_3, _row09_4, _row09_5, _row09_6, _row09_7];
  static List<List<int>> nineIn8 = [_row09_1, _row09_2, _row09_3, _row09_4, _row09_5, _row09_6, _row09_7, _row09_8];

  static List<int> _row10_1 = [1, 0, 1, 0, 1, 1, 0, 1, 0, 1];
  static List<int> _row10_2 = [1, 1, 0, 1, 0, 1, 1, 0, 1, 0];
  static List<int> _row10_3 = [0, 1, 1, 0, 1, 0, 1, 1, 0, 1];
  static List<int> _row10_4 = [1, 0, 1, 1, 0, 1, 0, 1, 1, 0];
  static List<int> _row10_5 = [0, 1, 0, 1, 1, 0, 1, 0, 1, 1];
  static List<int> _row10_6 = [1, 0, 1, 0, 1, 1, 0, 1, 0, 1];
  static List<int> _row10_7 = [1, 1, 0, 1, 0, 1, 1, 0, 1, 0];
  static List<int> _row10_8 = [0, 1, 1, 0, 1, 0, 1, 1, 0, 1];

  static List<List<int>> tenIn6 = [_row10_1, _row10_2, _row10_4, _row10_5, _row10_7, _row10_8];
  static List<List<int>> tenIn7 = [_row10_1, _row10_2, _row10_3, _row10_4, _row10_5, _row10_6, _row10_7];
  static List<List<int>> tenIn8 = [_row10_1, _row10_2, _row10_3, _row10_4, _row10_5, _row10_6, _row10_7, _row10_8];
}