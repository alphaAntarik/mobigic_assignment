import 'package:flutter/material.dart';

class HomeScreenProvider extends ChangeNotifier {
  TextEditingController _m = TextEditingController();
  TextEditingController _n = TextEditingController();
  TextEditingController _search = TextEditingController();
  TextEditingController get m => _m;
  TextEditingController get n => _n;
  TextEditingController get search => _search;
  List<List<String>> _grid = [];
  List<List<bool>> _highlightMatrix = [];
  List<List<String>> get grid => _grid;
  List<List<bool>> get highlightMatrix => _highlightMatrix;

  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  GlobalKey<FormState> _formkeysearch = GlobalKey<FormState>();
  GlobalKey<FormState> get formkey => _formkey;
  GlobalKey<FormState> get formkeysearch => _formkeysearch;
  void generateGrid() {
    if (_formkey.currentState!.validate()) {
      List<List<String>> matrix = List.generate(int.parse(_m.text),
          (i) => List.generate(int.parse(_n.text), (j) => ''));

      int count = 65;
      for (int i = 0; i < int.parse(_m.text); i++) {
        for (int j = 0; j < int.parse(_n.text); j++) {
          matrix[i][j] = String.fromCharCode(count);
          count++;
        }
      }

      _grid = matrix;
      notifyListeners();

      _highlightMatrix =
          List.generate(grid.length, (_) => List.filled(grid[0].length, false));
      notifyListeners();
    }
  }

  void searchAndHighlight() {
    if (_formkeysearch.currentState!.validate()) {
      print('${_search.text} in search');
      String searchText = _search.text.toUpperCase();
      if (searchText.isEmpty) {
        return;
      }

      for (int i = 0; i < grid.length; i++) {
        for (int j = 0; j < grid[i].length; j++) {
          if (searchFromPosition(searchText, i, j)) {
            highlightWord(searchText.length, i, j);

            return;
          }
        }
      }
    }
  }

  bool searchFromPosition(String searchText, int row, int col) {
    int numRows = _grid.length;
    int numCols = _grid[0].length;

    if (col + searchText.length <= numCols) {
      String foundText = '';
      for (int i = 0; i < searchText.length; i++) {
        foundText += _grid[row][col + i];
      }
      if (foundText == searchText) {
        return true;
      }
    }

    if (row + searchText.length <= numRows) {
      String foundText = '';
      for (int i = 0; i < searchText.length; i++) {
        foundText += grid[row + i][col];
      }
      if (foundText == searchText) {
        return true;
      }
    }

    if (row + searchText.length <= numRows &&
        col + searchText.length <= numCols) {
      String foundText = '';
      for (int i = 0; i < searchText.length; i++) {
        foundText += grid[row + i][col + i];
      }
      if (foundText == searchText) {
        return true;
      }
    }

    return false;
  }

  void highlightWord(int length, int row, int col) {
    for (int i = 0; i < length; i++) {
      _highlightMatrix[row][col + i] = true;
      notifyListeners();
      _highlightMatrix[row + i][col] = true;
      notifyListeners();
      _highlightMatrix[row + i][col + i] = true;
      notifyListeners();
    }
  }
}
