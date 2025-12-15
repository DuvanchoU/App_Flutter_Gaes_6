import 'package:flutter/material.dart';

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

