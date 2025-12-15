import 'package:flutter/material.dart';
import 'order_manager.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  static const Color primaryColor = Color(0xFF633D29);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        title: const Text(
          'Listado de Pedidos',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: OrderManager.pedidos.length,
        itemBuilder: (context, index) {
          final pedido = OrderManager.pedidos[index];

          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: ListTile(
              leading: Icon(Icons.receipt_long, color: primaryColor),
              title: Text(pedido['cliente']!),
              subtitle: Text(pedido['producto']!),
            ),
          );
        },
      ),
    );
  }
}
