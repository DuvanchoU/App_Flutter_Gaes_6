import 'package:flutter/material.dart';
import 'form_screen.dart';
import 'list_screen.dart';
import 'profile_screen.dart';
import 'order_manager.dart'; // 👈 1. Agregado: para acceder a los pedidos

class HomeScreen extends StatefulWidget { // 👈 2. Cambiado a StatefulWidget
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> { // 👈 3. Nueva clase de estado

  Widget _buildStatCard(
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: color.withOpacity(0.12),
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.2),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            CircleAvatar(
              radius: 22,
              backgroundColor: color.withOpacity(0.2),
              child: Icon(icon, color: color),
            ),
            const SizedBox(height: 12),
            Text(
              value,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: TextStyle(color: Colors.grey[700]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _quickAction(
    BuildContext context,
    IconData icon,
    String label,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: 26,
            backgroundColor: Colors.indigo.withOpacity(0.15),
            child: Icon(icon, color: Colors.indigo),
          ),
          const SizedBox(height: 6),
          Text(label, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  Widget _activityItem(String title, String subtitle, IconData icon) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.indigo.withOpacity(0.1),
        child: Icon(icon, color: Colors.indigo),
      ),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.chevron_right),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order RAE - Dashboard'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔹 Header
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.indigo.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: const [
                  Icon(Icons.store, size: 32, color: Colors.indigo),
                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Bienvenido a Order RAE',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('Panel de control del sistema'),
                    ],
                  )
                ],
              ),
            ),

            const SizedBox(height: 20),

            // 🔹 Métricas (¡AHORA DINÁMICAS!)
            Row(
              children: [
                _buildStatCard(
                  'Pedidos',
                  OrderManager.pedidos.length.toString(), // 👈 Dinámico
                  Icons.shopping_cart,
                  Colors.indigo,
                ),
                _buildStatCard(
                  'Clientes',
                  OrderManager.pedidos.map((p) => p['cliente'] as String).toSet().length.toString(), // 👈 Únicos
                  Icons.people,
                  Colors.green,
                ),
              ],
            ),
            Row(
              children: [
                _buildStatCard(
                  'Productos',
                  OrderManager.pedidos.map((p) => p['producto'] as String).toSet().length.toString(), // ✅ Dinámico
                  Icons.inventory,
                  Colors.orange,
                ),
                _buildStatCard(
                  'Ventas',
                  '\$3.200.000',
                  Icons.attach_money,
                  Colors.purple,
                ),
              ],
            ),

            const SizedBox(height: 24),

            // 🔹 Acciones rápidas
            const Text(
              'Acciones rápidas',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _quickAction(
                  context,
                  Icons.add_shopping_cart,
                  'Nuevo Pedido',
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const FormScreen()),
                    ).then((_) => setState(() {})); // 👈 Actualiza al volver
                  },
                ),
                _quickAction(
                  context,
                  Icons.list_alt,
                  'Pedidos',
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const ListScreen()),
                    ).then((_) => setState(() {})); // 👈 Opcional: también actualiza
                  },
                ),
                _quickAction(
                  context,
                  Icons.person,
                  'Perfil',
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const ProfileScreen()),
                    );
                  },
                ),
              ],
            ),

            const SizedBox(height: 30),

            // 🔹 Actividad reciente
            const Text(
              'Actividad reciente',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _activityItem(
              'Pedido registrado',
              'Cliente: Camilo – Sofá moderno',
              Icons.receipt_long,
            ),
            _activityItem(
              'Nuevo cliente',
              'Dayana fue agregada al sistema',
              Icons.person_add,
            ),
            _activityItem(
              'Producto actualizado',
              'Comedor 6 puestos',
              Icons.inventory_2,
            ),
          ],
        ),
      ),
    );
  }
}