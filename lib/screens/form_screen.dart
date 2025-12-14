import 'package:flutter/material.dart';
import 'order_manager.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final TextEditingController clienteCtrl = TextEditingController();
  final TextEditingController productoCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F5F0), // Fondo beige suave
      appBar: AppBar(
        backgroundColor: const Color(0xFF6D4C41), // Café oscuro
        title: const Text(
          'Registrar Pedido',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: clienteCtrl,
              decoration: InputDecoration(
                labelText: 'Cliente',
                labelStyle: const TextStyle(color: Color(0xFF5D4037)), // Café medio
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Color(0xFFBDBDBD)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Color(0xFF6D4C41), width: 2),
                ),
              ),
              style: const TextStyle(color: Color(0xFF3E2723)), // Café profundo
            ),
            const SizedBox(height: 20),
            TextField(
              controller: productoCtrl,
              decoration: InputDecoration(
                labelText: 'Producto',
                labelStyle: const TextStyle(color: Color(0xFF5D4037)),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Color(0xFFBDBDBD)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Color(0xFF6D4C41), width: 2),
                ),
              ),
              style: const TextStyle(color: Color(0xFF3E2723)),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (clienteCtrl.text.isNotEmpty && productoCtrl.text.isNotEmpty) {
                    OrderManager.addPedido(clienteCtrl.text, productoCtrl.text);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Pedido registrado correctamente'),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6D4C41), // Café oscuro
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text('Guardar Pedido', style: TextStyle(fontSize: 18)),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Navigator.pop(context),
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFF6D4C41),
                  side: const BorderSide(color: Color(0xFF6D4C41)),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text('Volver', style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}