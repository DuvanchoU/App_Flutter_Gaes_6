import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final TextEditingController _controller = TextEditingController();
  String _mensaje = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Formulario',
          style: TextStyle(fontFamily: 'RobotoCustom'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Ingresa tu nombre',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_controller.text.isNotEmpty) {
                  setState(() {
                    _mensaje = '¡Hola, ${_controller.text}!';
                  });
                }
              },
              child: Text('Saludar'),
            ),
            SizedBox(height: 20),
            if (_mensaje.isNotEmpty)
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.blueAccent.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  _mensaje,
                  style: TextStyle(fontSize: 18, fontFamily: 'RobotoCustom'),
                ),
              ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Volver'),
            ),
          ],
        ),
      ),
    );
  }
}