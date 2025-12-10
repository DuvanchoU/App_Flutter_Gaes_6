import 'package:flutter/material.dart';
import 'form_screen.dart';
import 'list_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key}); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'App GAES',
          style: TextStyle(fontFamily: 'RobotoCustom'),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/logo_order.png'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    color: Colors.grey.withOpacity(0.5),
                  )
                ],
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => FormScreen()),
                );
              },
              child: Text('Ir a Formulario'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => ListScreen()),
                );
              },
              child: Text('Ver Lista'),
            ),
          ],
        ),
      ),
    );
  }
}