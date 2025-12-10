import 'package:flutter/material.dart';

class ListScreen extends StatelessWidget {
  final List<String> nombres = ['Ana', 'Luis', 'Carla', 'Duban', 'Sofía'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lista de Nombres', fontFamily: 'RobotoCustom')),
      body: ListView.builder(
        itemCount: nombres.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      nombres[index],
                      style: TextStyle(fontSize: 18, fontFamily: 'RobotoCustom'),
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios, size: 16),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}