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
      appBar: AppBar(
        title: const Text('La Super Bodega del Mueble'),
        actions: [
          Tooltip(
            message: 'Dashboard',
            child: IconButton(
              icon: const Icon(Icons.dashboard),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const HomeScreen()),
                );
              },
            ),
          )
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: searchController,
              onChanged: (value) {
                setState(() {
                  filtro = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Buscar muebles...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: productosFiltrados.length,
        itemBuilder: (context, index) {
          final producto = productosFiltrados[index];

          return Card(
            margin: const EdgeInsets.all(12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                  child: Image.asset(
                    producto['imagen']!,
                    height: 180,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
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
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              producto['precio']!,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.green,
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
                            ),
                          );
                        },
                        child: const Text('Comprar'),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
