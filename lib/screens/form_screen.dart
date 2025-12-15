import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final TextEditingController clienteCtrl = TextEditingController();
  final TextEditingController productoCtrl = TextEditingController();

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
          'Registrar Pedido',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),

      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            constraints: const BoxConstraints(maxWidth: 420),
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(24),
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
                // Título del formulario
                const Text(
                  'Nuevo Pedido',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Complete la información del pedido',
                  style: TextStyle(color: Colors.grey[600]),
                ),

                const SizedBox(height: 24),

                // Campo Cliente
                TextField(
                  controller: clienteCtrl,
                  decoration: InputDecoration(
                    labelText: 'Cliente',
                    prefixIcon: const Icon(Icons.person_outline),
                    filled: true,
                    fillColor: const Color(0xFFF1F1F1),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Campo Producto
                TextField(
                  controller: productoCtrl,
                  decoration: InputDecoration(
                    labelText: 'Producto',
                    prefixIcon: const Icon(Icons.inventory_2_outlined),
                    filled: true,
                    fillColor: const Color(0xFFF1F1F1),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),

                const SizedBox(height: 28),

                // Botón Guardar
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (clienteCtrl.text.isNotEmpty &&
                          productoCtrl.text.isNotEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content:
                                const Text('Pedido registrado correctamente'),
                            backgroundColor: primaryColor,
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    child: const Text('Guardar Pedido'),
                  ),
                ),

                const SizedBox(height: 14),

                // Botón Volver
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: primaryColor,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      side: const BorderSide(color: primaryColor),
                    ),
                    child: const Text('Volver'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
