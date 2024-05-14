import 'package:flutter/material.dart';

void main() {
  runApp(MatrixMultiplyApp());
}

class MatrixMultiplyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Matrix Multiplier',
      home: MatrixMultiplyScreen(),
    );
  }
}

class MatrixMultiplyScreen extends StatefulWidget {
  @override
  _MatrixMultiplyScreenState createState() => _MatrixMultiplyScreenState();
}

class _MatrixMultiplyScreenState extends State<MatrixMultiplyScreen> {
  int s11 = 0;
  int s12 = 0;
  int s21 = 0;
  int s22 = 0;
  int t11 = 0;
  int t12 = 0;
  int t21 = 0;
  int t22 = 0;
  int p11 = 0;
  int p12 = 0;
  int p21 = 0;
  int p22 = 0;

  void updateS(int row, int col) {
    setState(() {
      if (row == 0 && col == 0) {
        s11 = (s11 + 1) % 10;
      } else if (row == 0 && col == 1) {
        s12 = (s12 + 1) % 10;
      } else if (row == 1 && col == 0) {
        s21 = (s21 + 1) % 10;
      } else if (row == 1 && col == 1) {
        s22 = (s22 + 1) % 10;
      }
    });
  }

  void updateT(int row, int col) {
    setState(() {
      if (row == 0 && col == 0) {
        t11 = (t11 + 1) % 10;
      } else if (row == 0 && col == 1) {
        t12 = (t12 + 1) % 10;
      } else if (row == 1 && col == 0) {
        t21 = (t21 + 1) % 10;
      } else if (row == 1 && col == 1) {
        t22 = (t22 + 1) % 10;
      }
    });
  }

  void updateP(){
    setState(() {
      p11 = (s11 * t11 + s12 * t21) % 10;
      p12 = (s11 * t12 + s12 * t22) % 10;
      p21 = (s21 * t11 + s22 * t21) % 10;
      p22 = (s21 * t12 + s22 * t22) % 10;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Matrix Multiplier')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Text(
            //   "Matrix Multiplier",
            //   style: TextStyle(fontSize: 20),
            // ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    _buildMatrixCell(s11, 0, 0, updateS),
                    _buildMatrixCell(s12, 0, 1, updateS),
                  ],
                ),
                //SizedBox(width: 20),
                Column(
                  children: [
                    _buildMatrixCell(t11, 0, 0, updateT),
                    _buildMatrixCell(t12, 0, 1, updateT),
                  ],
                ),
                SizedBox(width: 20),
                Column(
                  children: [
                    FloatingActionButton(
                      backgroundColor: Colors.blue,
                      child: Text(
                        "X",
                        style: TextStyle(
                          fontSize: 22,
                        )
                      ),
                      onPressed: () {
                        updateP();
                      },
                    ),
                  ],
                ),
                SizedBox(width: 20),
                Column(
                  children: [
                    _buildMatrixCell(s21, 1, 0, updateS),
                    _buildMatrixCell(s22, 1, 1, updateS),
                  ],
                ),
                //SizedBox(width: 20),
                Column(
                  children: [
                    _buildMatrixCell(t21, 1, 0, updateT),
                    _buildMatrixCell(t22, 1, 1, updateT),
                  ],
                ),
                SizedBox(width: 20),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text("$p11",style: TextStyle(fontSize: 40, color: Colors.blue),),
                    Text("$p21",style: TextStyle(fontSize: 40, color: Colors.blue),),
                  ],
                ),
                SizedBox(width: 20),
                Column(
                  children: [
                    Text("$p12",style: TextStyle(fontSize: 40, color: Colors.blue),),
                    Text("$p22",style: TextStyle(fontSize: 40, color: Colors.blue),),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMatrixCell(int value, int row, int col, Function(int, int) onPressed) {
    return GestureDetector(
      onTap: () => onPressed(row, col),
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue),
        ),
        child: Center(
          child: Text(
            value.toString(),
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }
}