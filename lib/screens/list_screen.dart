import 'package:flutter/material.dart';
import 'order_manager.dart'; // Asegúrate de que este archivo exista y tenga la lista

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});
  static const Color primaryColor = Color(0xFF633D29);

  static final List<Map<String, String>> pedidos = [
    {'cliente': 'Camilo Piñeros', 'producto': 'Sofá'},
    {'cliente': 'Dayana Rincón', 'producto': 'Comedor'},
    {'cliente': 'Gonzalo Galindo', 'producto': 'Cama'},
    {'cliente': 'Duban Uribe', 'producto': 'Colchón'},
  ];
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

      body: Center(
        child: ListView.builder(
          padding: const EdgeInsets.only(top: 16, bottom: 24),
          itemCount: pedidos.length,
          itemBuilder: (context, index) {
            final pedido = pedidos[index];

            return Container(
              width: double.infinity,
              constraints: const BoxConstraints(maxWidth: 420),
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 16,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Row(
                children: [
                  // Icono
                  CircleAvatar(
                    radius: 22,
                    backgroundColor: primaryColor.withOpacity(0.15),
                    child: const Icon(
                      Icons.receipt_long,
                      color: primaryColor,
                    ),
                  ),

                  const SizedBox(width: 16),

                  // Información
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          pedido['cliente']!,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          pedido['producto']!,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Flecha
                  Icon(
                    Icons.chevron_right,
                    color: Colors.grey[500],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
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
