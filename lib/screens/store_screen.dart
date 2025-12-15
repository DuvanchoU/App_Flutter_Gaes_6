import 'package:flutter/material.dart';
import 'home_screen.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({super.key});

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  final TextEditingController searchController = TextEditingController();

  final List<Map<String, String>> productos = [
    {
      'nombre': 'Sofá Moderno',
      'precio': '\$1.200.000',
      'imagen': 'assets/images/sofa.png',
    },
    {
      'nombre': 'Comedor 6 Puestos',
      'precio': '\$1.800.000',
      'imagen': 'assets/images/comedor.png',
    },
    {
      'nombre': 'Cama Doble',
      'precio': '\$1.500.000',
      'imagen': 'assets/images/cama.png',
    },
  ];

  String filtro = '';

  @override
  Widget build(BuildContext context) {
    final productosFiltrados = productos
        .where((p) =>
            p['nombre']!.toLowerCase().contains(filtro.toLowerCase()))
        .toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),

      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF633D29), // CAFÉ
        foregroundColor: Colors.white,
        title: const Text(
          'LA SUPER BODEGA DEL MUEBLE',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
            letterSpacing: 0.5,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            tooltip: 'Dashboard',
            icon: const Icon(Icons.dashboard_outlined, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const HomeScreen()),
              );
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 14),
            child: TextField(
              controller: searchController,
              onChanged: (value) {
                setState(() => filtro = value);
              },
              decoration: InputDecoration(
                hintText: 'Buscar muebles...',
                prefixIcon:
                    const Icon(Icons.search, color: Colors.grey),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 12, horizontal: 16),
                hintStyle: const TextStyle(color: Colors.grey),
              ),
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ),
      ),

      body: ListView.builder(
        padding: const EdgeInsets.only(bottom: 24, top: 8),
        itemCount: productosFiltrados.length,
        itemBuilder: (context, index) {
          final producto = productosFiltrados[index];

          return Center(
            child: Container(
              width: double.infinity,
              constraints: const BoxConstraints(maxWidth: 600),
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 16,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    child: Image.asset(
                      producto['imagen']!,
                      height: 180,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                producto['nombre']!,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                producto['precio']!,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF16A34A),
                                ),
                              ),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  '${producto['nombre']} agregado al pedido',
                                ),
                                backgroundColor: const Color(0xFF633D29),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color(0xFF633D29),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text('Comprar'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

