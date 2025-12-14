import 'package:flutter/material.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  static final List<Map<String, String>> pedidos = [
    {'cliente': 'Camilo', 'producto': 'Sofá'},
    {'cliente': 'Dayana', 'producto': 'Comedor'},
    {'cliente': 'Gonzalo', 'producto': 'Cama'},
    {'cliente': 'Duban', 'producto': 'Colchón'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pedidos'),
      ),
      body: ListView.builder(
        itemCount: pedidos.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: const Icon(Icons.receipt_long),
              title: Text(pedidos[index]['cliente']!),
              subtitle: Text(pedidos[index]['producto']!),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            ),
          );
        },
      ),
    );
  }
}
