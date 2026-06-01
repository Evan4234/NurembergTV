import 'package:flutter/material.dart';

import '../../widgets/text_field_widget.dart';
import '../../widgets/button_widget.dart';

class RegisterScreen extends StatelessWidget {
  static const name = 'register-screen';

  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E2128),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Row(
          children: [
            Icon(Icons.diamond, color: Colors.white, size: 20),
            SizedBox(width: 8),
            Text(
              'Nuremberg TV',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Crear cuenta',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 32),

              const CustomTextField(
                label: 'Nombre',
                hintText: 'Tu nombre',
              ),
              const SizedBox(height: 20),

              const CustomTextField(
                label: 'Apellido',
                hintText: 'Tu apellido',
              ),
              const SizedBox(height: 20),

              const CustomTextField(
                label: 'Correo electrónico',
                hintText: 'Correo electrónico',
              ),
              const SizedBox(height: 20),

              const CustomTextField(
                label: 'Contraseña',
                hintText: 'Contraseña',
                isPassword: true,
              ),
              const SizedBox(height: 20),

              const CustomTextField(
                label: 'Confirmar contraseña',
                hintText: 'Confirmar contraseña',
                isPassword: true,
              ),

              const SizedBox(height: 12),
              const Text(
                'Usa 8 o más caracteres con una mezcla de letras, números y símbolos',
                style: TextStyle(color: Colors.white54, fontSize: 12),
              ),

              const SizedBox(height: 32),

              SizedBox(
                width: double.infinity,
                child: CustomButton(
                  text: 'Continuar',
                  onPressed: () {
                    // Lógica para registrar
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
