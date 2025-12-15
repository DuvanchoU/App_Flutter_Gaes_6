import 'package:flutter/material.dart';
import 'screens/store_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Color corporativo
  static const Color primaryColor = Color(0xFF633D29);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Order RAE',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'RobotoCustom',

        // Esquema de colores
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryColor,
          primary: primaryColor,
          brightness: Brightness.light,
        ),

        // AppBar 
        appBarTheme: const AppBarTheme(
          backgroundColor: primaryColor,
          elevation: 0,
          centerTitle: true,

          // TEXTO BLANCO
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),

          // ICONOS BLANCOS
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),

        // Botones elevados
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),

        // Campos de texto
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color(0xFFF1F1F1),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide.none,
          ),
          hintStyle: const TextStyle(color: Colors.grey),
        ),
      ),

      // Vista inicial
      home: const StoreScreen(),
    );
  }
}
