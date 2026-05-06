// lib/screens/auth/login_screen.dart
import 'package:flutter/material.dart';
import 'package:pawlink/screens/auth/register_screen.dart';
import 'package:pawlink/screens/home_screen.dart';
import 'package:pawlink/theme/app_theme.dart';
import 'package:pawlink/widgets/custom_button.dart';
import 'package:pawlink/widgets/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _rememberMe = false;

  void _login() {
    if (_formKey.currentState!.validate()) {
      // Aquí iría la lógica de autenticación con el backend
      // Por ahora, navegamos a la pantalla principal
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Iniciar Sesión'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppTheme.defaultPadding),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Título principal
                const Text(
                  'iComencemos Ahora!',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.textColorPrimary,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Use nuestra app de forma sencilla en una pantalla de registro.',
                  style: TextStyle(
                    fontSize: 16,
                    color: AppTheme.textColorSecondary,
                  ),
                ),
                const SizedBox(height: 30),

                // Selector de Inicio sesión / Registrarte (Tabs)
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            color: AppTheme.primaryColor,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: const Center(
                            child: Text(
                              'Inicio de sesión',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const RegisterScreen()),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: const Center(
                              child: Text(
                                'Registrarte',
                                style: TextStyle(
                                  color: AppTheme.textColorSecondary,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),

                // Campos del formulario
                CustomTextField(
                  label: 'Correo:',
                  hintText: 'ana@mail.com',
                  prefixIcon: Icons.email_outlined,
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa tu correo';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                CustomTextField(
                  label: 'Contraseña:',
                  hintText: '********',
                  prefixIcon: Icons.lock_outline,
                  obscureText: true,
                  controller: _passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa tu contraseña';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),

                // Recuerde siempre y ¿Quieres continuar?
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Checkbox(
                            value: _rememberMe,
                            activeColor: AppTheme.primaryColor,
                            onChanged: (value) {
                              setState(() {
                                _rememberMe = value ?? false;
                              });
                            },
                          ),
                          const Text(
                            'Recuerde siempre',
                            style: TextStyle(color: AppTheme.textColorSecondary),
                          ),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // Navegar a recuperar contraseña
                      },
                      child: const Text('¿Quieres continuar?'),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Botón Iniciar sesión
                CustomButton(
                  text: 'Iniciar sesión',
                  onPressed: _login,
                ),
                const SizedBox(height: 15),

                // Botón Continuar con Google
                CustomButton(
                  text: 'Continuar con Google',
                  onPressed: () {},
                  icon: Icons.g_mobiledata,
                  isOutlined: true,
                ),
                const SizedBox(height: 10),

                // Botón Continuar con Facebook
                CustomButton(
                  text: 'Continuar con Facebook',
                  onPressed: () {},
                  icon: Icons.facebook,
                  isOutlined: true,
                ),
                const SizedBox(height: 30),

                // Footer: Pet Care in Your Neighbourhood
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppTheme.primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'Pet Care in Your Neighbourhood',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.textColorPrimary,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Connect with 5-star pet caregivers near you who offer boarding, walking, house sitting or day care.',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: AppTheme.textColorSecondary),
                      ),
                      const SizedBox(height: 15),
                      CustomButton(
                        text: 'Get Started',
                        onPressed: () {},
                      ),
                    ],
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