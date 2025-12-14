import 'package:flutter/material.dart';
import 'order_manager.dart'; // Asegúrate de que este archivo exista y tenga la lista

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pedidos'),
        backgroundColor: Colors.brown[800], // Tonos de madera oscuros
        foregroundColor: Colors.white,
        elevation: 4,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: OrderManager.pedidos.length,
        itemBuilder: (context, index) {
          final pedido = OrderManager.pedidos[index];
          final cliente = pedido['cliente']!;
          final producto = pedido['producto']!;

          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              color: Colors.brown[50], // Fondo claro como madera clara
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.brown[300]!, width: 1),
              boxShadow: [
                BoxShadow(
                  color: Colors.brown.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ListTile(
              leading: Icon(
                Icons.receipt_long,
                color: Colors.brown[700],
                size: 28,
              ),
              title: Text(
                cliente,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown[900],
                ),
              ),
              subtitle: Text(
                producto,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.brown[700],
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.brown[500],
                size: 16,
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              tileColor: Colors.brown[50],
              hoverColor: Colors.brown[100],
              splashColor: Colors.brown[200],
            ),
          );
        },
      ),
    );
  }
}