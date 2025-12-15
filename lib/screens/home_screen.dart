import 'package:flutter/material.dart';
import 'form_screen.dart';
import 'list_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const Color primaryColor = Color(0xFF633D29);

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
              backgroundColor: primaryColor.withOpacity(0.12),
              child: Icon(icon, color: primaryColor),
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
            radius: 28,
            backgroundColor: primaryColor.withOpacity(0.12),
            child: Icon(icon, color: primaryColor),
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
          backgroundColor: primaryColor.withOpacity(0.12),
          child: Icon(icon, color: primaryColor),
        ),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),

      appBar: AppBar(
        elevation: 0,
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        title: const Text(
          'ORDER RAE - DASHBOARD',
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
                color: primaryColor.withOpacity(0.12),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                children: const [
                  Icon(Icons.store, size: 34, color: primaryColor),
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

            const SizedBox(height: 24),

            // Métricas
            Row(
              children: [
                _buildStatCard('Pedidos', '12', Icons.shopping_cart),
                _buildStatCard('Clientes', '8', Icons.people),
              ],
            ),
            Row(
              children: [
                _buildStatCard('Productos', '25', Icons.inventory),
                _buildStatCard('Ventas', '\$3.200.000', Icons.attach_money),
              ],
            ),

            const SizedBox(height: 28),

            // 🔹 Acciones rápidas
            const Text(
              'Acciones rápidas',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 14),
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
                    );
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
                    );
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

            const SizedBox(height: 32),

            // Actividad reciente
            const Text(
              'Actividad reciente',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
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
