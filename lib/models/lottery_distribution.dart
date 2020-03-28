abstract class SystemEuroJackpot {  
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