import 'package:flutter/material.dart';
class SelectedDangerWidget extends StatelessWidget {
  const SelectedDangerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 100,
        width: double.infinity,
        color: Colors.white,
        child: Column(
          children: [
            Row(
              children: [
                Text('النوع',style: TextStyle(
                  color: Colors.blue[900],
                  fontSize: 20,
                  fontWeight: FontWeight.w800
                ),),
                Text('النوع',style: TextStyle(
                    color: Colors.blue[900],
                    fontSize: 20,
                    fontWeight: FontWeight.w800
                ),),
              ],
            )
          ],
        ),
      ),
    );
  }
}
