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

  static const Color primaryColor = Color(0xFF633D29);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        title: const Text('Registrar Pedido'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: clienteCtrl,
              decoration: const InputDecoration(labelText: 'Cliente'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: productoCtrl,
              decoration: const InputDecoration(labelText: 'Producto'),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                if (clienteCtrl.text.isNotEmpty &&
                    productoCtrl.text.isNotEmpty) {
                  OrderManager.addPedido(
                    clienteCtrl.text,
                    productoCtrl.text,
                  );
                  Navigator.pop(context);
                }
              },
              child: const Text('Guardar'),
            ),
          ],
        ),
      ),
    );
  }
}
