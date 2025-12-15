import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
          'Perfil de Usuario',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),

      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Container(
            width: double.infinity,
            constraints: const BoxConstraints(maxWidth: 420),
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(22),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 18,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              children: [
                // Avatar
                CircleAvatar(
                  radius: 70,
                  backgroundColor: primaryColor.withOpacity(0.15),
                  child: CircleAvatar(
                    radius: 64,
                    backgroundImage:
                      const AssetImage('assets/images/logo_order.png'),
                    backgroundColor: Colors.white,
                  ),
                ),


                const SizedBox(height: 20),

                // Nombre
                const Text(
                  'Usuario del Sistema',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 6),

                // Rol
                Text(
                  'Rol: Vendedor',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),

                const SizedBox(height: 24),

                const Divider(),

                const SizedBox(height: 16),

                // Información adicional
                _profileItem(
                  icon: Icons.email_outlined,
                  label: 'Correo',
                  value: 'usuario@orderrae.com',
                ),
                _profileItem(
                  icon: Icons.badge_outlined,
                  label: 'Perfil',
                  value: 'Usuario Operativo',
                ),
                _profileItem(
                  icon: Icons.verified_user_outlined,
                  label: 'Estado',
                  value: 'Activo',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Item reutilizable
  static Widget _profileItem({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          CircleAvatar(
            radius: 18,
            backgroundColor: primaryColor.withOpacity(0.12),
            child: Icon(icon, size: 18, color: primaryColor),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
