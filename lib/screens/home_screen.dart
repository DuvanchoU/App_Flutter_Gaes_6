import 'package:flutter/material.dart';
import 'form_screen.dart';
import 'list_screen.dart';
import 'profile_screen.dart';
import 'order_manager.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const Color primaryColor = Color(0xFF633D29);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget _buildStatCard(
    String title,
    String value,
    IconData icon,
  ) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(18),
        margin: const EdgeInsets.all(8),
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
        child: Column(
          children: [
            CircleAvatar(
              radius: 22,
              backgroundColor: HomeScreen.primaryColor.withOpacity(0.12),
              child: Icon(icon, color: HomeScreen.primaryColor),
            ),
            const SizedBox(height: 14),
            Text(
              value,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              title,
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _quickAction(
    IconData icon,
    String label,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: HomeScreen.primaryColor.withOpacity(0.12),
            child: Icon(icon, color: HomeScreen.primaryColor),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _activityItem(String title, String subtitle, IconData icon) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: HomeScreen.primaryColor.withOpacity(0.12),
          child: Icon(icon, color: HomeScreen.primaryColor),
        ),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final pedidos = OrderManager.pedidos;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: HomeScreen.primaryColor,
        foregroundColor: Colors.white,
        title: const Text(
          'ORDER RAE - PANEL DE CONTROL',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: HomeScreen.primaryColor.withOpacity(0.12),
                borderRadius: BorderRadius.circular(18),
              ),
              child: const Row(
                children: [
                  Icon(Icons.store, size: 34, color: HomeScreen.primaryColor),
                  SizedBox(width: 14),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'BIENVENIDO A ORDER RAE',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Panel de control del sistema',
                        style: TextStyle(color: Colors.black54),
                      ),
                    ],
                  )
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Métricas dinámicas
            Row(
              children: [
                _buildStatCard(
                  'Pedidos',
                  pedidos.length.toString(),
                  Icons.shopping_cart,
                ),
                _buildStatCard(
                  'Clientes',
                  pedidos.map((p) => p['cliente']).toSet().length.toString(),
                  Icons.people,
                ),
              ],
            ),
            Row(
              children: [
                _buildStatCard(
                  'Productos',
                  pedidos.map((p) => p['producto']).toSet().length.toString(),
                  Icons.inventory,
                ),
                _buildStatCard(
                  'Ventas',
                  '\$3.200.000',
                  Icons.attach_money,
                ),
              ],
            ),

            const SizedBox(height: 28),

            // Acciones rápidas
            const Text(
              'Acciones rápidas',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 14),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _quickAction(
                  Icons.add_shopping_cart,
                  'Nuevo Pedido',
                  () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const FormScreen()),
                    );
                    setState(() {});
                  },
                ),
                _quickAction(
                  Icons.list_alt,
                  'Pedidos',
                  () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const ListScreen()),
                    );
                    setState(() {});
                  },
                ),
                _quickAction(
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

            const SizedBox(height: 32),

            // Actividad reciente
            const Text(
              'Actividad reciente',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            ...pedidos.take(3).map(
              (p) => _activityItem(
                'Pedido registrado',
                'Cliente: ${p['cliente']} – ${p['producto']}',
                Icons.receipt_long,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
