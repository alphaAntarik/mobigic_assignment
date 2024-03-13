import 'package:flutter/material.dart';
import 'package:mobigic_antarik/home_screens/providers/homescreen_provider.dart';
import 'package:provider/provider.dart';

class GridWidget extends StatelessWidget {
  const GridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenProvider>(
      builder: (context, value, child) {
        return Container(
          height: 300,
          width: 300,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: value.grid[0].length,
            ),
            itemBuilder: (context, index) {
              int row = index ~/ value.grid[0].length;
              int col = index % value.grid[0].length;
              return Container(
                decoration: BoxDecoration(
                  border: Border.all(),
                  color: value.highlightMatrix[row][col]
                      ? Colors.yellow
                      : Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Center(
                  child: Text(
                    value.grid[row][col],
                    style: TextStyle(
                      fontWeight: value.highlightMatrix[row][col]
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                ),
              );
            },
            itemCount: value.grid.length * value.grid[0].length,
          ),
        );
      },
    );
  }
}
