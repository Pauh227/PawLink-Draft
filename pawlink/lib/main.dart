import 'package:flutter/material.dart';

void main() {
  runApp(const PawLinkApp());
}

class PawLinkApp extends StatelessWidget {
  const PawLinkApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PawLink',
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        final media = MediaQuery.of(context);
        return MediaQuery(
          data: media.copyWith(textScaler: const TextScaler.linear(1.0)),
          child: child ?? const SizedBox.shrink(),
        );
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFFC233),
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFF8D9CB1),
        useMaterial3: true,
      ),
      home: const PrototypeGalleryScreen(),
    );
  }
}

class PrototypeGalleryScreen extends StatefulWidget {
  const PrototypeGalleryScreen({super.key});

  @override
  State<PrototypeGalleryScreen> createState() => _PrototypeGalleryScreenState();
}

class _PrototypeGalleryScreenState extends State<PrototypeGalleryScreen> {
  final _controller = PageController(viewportFraction: 0.82);

  final List<_PreviewCardData> _screens = const [
    _PreviewCardData('Login', LoginPreview()),
    _PreviewCardData('Sign up', SignUpPreview()),
    _PreviewCardData('Main', SplashPreview()),
    _PreviewCardData('Onboarding', OnboardingPreview()),
    _PreviewCardData('Mapa', MapPreview()),
    _PreviewCardData('Perfil', PetProfilePreview()),
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            const Text(
              'PawLink • Prototipo Flutter',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 22,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Desliza para revisar las pantallas principales',
              style: TextStyle(color: Colors.white70),
            ),
            const SizedBox(height: 18),
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: _screens.length,
                itemBuilder: (context, index) {
                  final item = _screens[index];
                  return Center(
                    child: SizedBox(
                      width: 300,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8, bottom: 8),
                              child: Text(
                                item.title,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Expanded(child: item.child),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PreviewCardData {
  final String title;
  final Widget child;

  const _PreviewCardData(this.title, this.child);
}

class PhoneFrame extends StatelessWidget {
  final Widget child;

  const PhoneFrame({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 16,
            offset: Offset(0, 8),
          ),
        ],
      ),
      clipBehavior: Clip.hardEdge,
      child: child,
    );
  }
}

class LoginPreview extends StatelessWidget {
  const LoginPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return const PhoneFrame(
      child: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 10),
        child: Column(
        children: [
          _HeaderImage(
            url:
                'https://images.unsplash.com/photo-1548199973-03cce0bbc87b?auto=format&fit=crop&w=900&q=80',
            title: 'Conectemos Ahora!',
            subtitle: 'Crear lazos con los héroes de cuatro patas de tu ciudad',
            height: 160,
          ),
          _AuthTabs(primary: 'Inicio de sesión', secondary: 'Registro'),
          _InputHint(label: 'Correo', value: 'AnaPaw@gmail.com'),
          _InputHint(label: 'Contraseña', value: '••••••••'),
          SizedBox(height: 8),
          _MainButton(text: 'Iniciar sesión'),
          SizedBox(height: 12),
          _SocialButton(text: 'Continuar con Google'),
          SizedBox(height: 8),
          _SocialButton(text: 'Continuar con Facebook'),
        ],
        ),
      ),
    );
  }
}

class SignUpPreview extends StatelessWidget {
  const SignUpPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return const PhoneFrame(
      child: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 10),
        child: Column(
        children: [
          _HeaderImage(
            url:
                'https://images.unsplash.com/photo-1511044568932-338cba0ad803?auto=format&fit=crop&w=900&q=80',
            title: 'Crea Tu Cuenta',
            subtitle: 'Unimos comunidad y tecnología por los animales',
            height: 148,
          ),
          _AuthTabs(primary: 'Inicio de sesión', secondary: 'Registro', selectedRight: true),
          _InputHint(label: 'Nombre', value: 'Ana Paulina Hernández'),
          _InputHint(label: 'Matrícula', value: 'A01738490'),
          _InputHint(label: 'CURP', value: 'HEPA000000MX'),
          _InputHint(label: 'Correo', value: 'AnaPaw@gmail.com'),
          _InputHint(label: 'Contraseña', value: '••••••••'),
          SizedBox(height: 10),
          _DarkButton(text: 'Registrarme'),
        ],
        ),
      ),
    );
  }
}

class SplashPreview extends StatelessWidget {
  const SplashPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return PhoneFrame(
      child: Container(
        color: const Color(0xFFF3CA6C),
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.network(
                'https://images.unsplash.com/photo-1543852786-1cf6624b9987?auto=format&fit=crop&w=900&q=80',
                fit: BoxFit.cover,
              ),
            ),
            Positioned.fill(
              child: Container(color: const Color(0xAAE8C066)),
            ),
            const Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Pawlink',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF6D3F1F),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text('🐾', style: TextStyle(fontSize: 54)),
                ],
              ),
            ),
            const Positioned(
              bottom: 20,
              left: 24,
              right: 24,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Color(0x80FFFFFF),
                  borderRadius: BorderRadius.all(Radius.circular(24)),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    'Versión 1.0',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color(0xFF78592A)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OnboardingPreview extends StatelessWidget {
  const OnboardingPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return PhoneFrame(
      child: Column(
        children: [
          Expanded(
            child: Image.network(
              'https://images.unsplash.com/photo-1583512603806-077998240c7a?auto=format&fit=crop&w=900&q=80',
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 12),
            child: Column(
              children: [
                Text(
                  'Pet Care In Your Neighborhood',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 8),
                Text(
                  'Conecta con cuidadores cercanos para paseos, apoyo temporal y avisos de mascotas perdidas.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black54),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(18, 0, 18, 20),
            child: _MainButton(text: 'Get Started'),
          ),
        ],
      ),
    );
  }
}

class MapPreview extends StatelessWidget {
  const MapPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return PhoneFrame(
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              'https://images.unsplash.com/photo-1569336415962-a4bd9f69c07b?auto=format&fit=crop&w=900&q=80',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(color: Colors.white.withOpacity(0.74)),
          ),
          const Positioned(
            top: 18,
            left: 18,
            right: 18,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Pet caregivers', style: TextStyle(fontWeight: FontWeight.w700)),
                    Icon(Icons.tune, size: 20),
                  ],
                ),
              ),
            ),
          ),
          ...[
            const _MapPin(top: 120, left: 60, emoji: '🐕'),
            const _MapPin(top: 210, left: 180, emoji: '🐈'),
            const _MapPin(top: 280, left: 90, emoji: '🐶'),
            const _MapPin(top: 160, left: 240, emoji: '🦮'),
          ],
          const Positioned(
            left: 18,
            right: 18,
            bottom: 18,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(22)),
              ),
              child: Padding(
                padding: EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Lina Amae', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                    SizedBox(height: 3),
                    Text('1.2 km away from you', style: TextStyle(color: Colors.black54)),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('⭐ 4.9   20 reviews'),
                        Text('\$20', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PetProfilePreview extends StatelessWidget {
  const PetProfilePreview({super.key});

  @override
  Widget build(BuildContext context) {
    return PhoneFrame(
      child: Column(
        children: [
          SizedBox(
            height: 220,
            width: double.infinity,
            child: Image.network(
              'https://images.unsplash.com/photo-1541599540903-216a46ca1dc0?auto=format&fit=crop&w=900&q=80',
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Itachi', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800)),
                  const Text('French Bulldog · 1y 4m', style: TextStyle(color: Colors.black54)),
                  const SizedBox(height: 14),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: const [
                      _ChipLabel(label: 'Weight 5.5 kg'),
                      _ChipLabel(label: 'Height 42 cm'),
                      _ChipLabel(label: 'Color Brown'),
                    ],
                  ),
                  const SizedBox(height: 14),
                  const Text(
                    'My dog is incredibly and unconditionally loyal to me. He loves me as much as I love him.',
                    style: TextStyle(color: Colors.black87),
                  ),
                  const SizedBox(height: 14),
                  const Text('Itachi behavior', style: TextStyle(fontWeight: FontWeight.w700)),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: const [
                      _ChipLabel(label: 'Leash trained'),
                      _ChipLabel(label: 'Friendly with cats'),
                      _ChipLabel(label: 'Active'),
                      _ChipLabel(label: 'Tries to eat things'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HeaderImage extends StatelessWidget {
  final String url;
  final String title;
  final String subtitle;
  final double height;

  const _HeaderImage({
    required this.url,
    required this.title,
    required this.subtitle,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: height,
          width: double.infinity,
          child: Image.network(url, fit: BoxFit.cover),
        ),
        Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [Colors.black45, Colors.transparent],
              ),
            ),
          ),
        ),
        Positioned(
          left: 14,
          right: 14,
          bottom: 10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                subtitle,
                style: const TextStyle(color: Colors.white70, fontSize: 11),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _AuthTabs extends StatelessWidget {
  final String primary;
  final String secondary;
  final bool selectedRight;

  const _AuthTabs({
    required this.primary,
    required this.secondary,
    this.selectedRight = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFF1F1F1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 9),
                decoration: BoxDecoration(
                  color: selectedRight ? Colors.transparent : Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(primary, textAlign: TextAlign.center),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 9),
                decoration: BoxDecoration(
                  color: selectedRight ? Colors.white : Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(secondary, textAlign: TextAlign.center),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InputHint extends StatelessWidget {
  final String label;
  final String value;

  const _InputHint({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 2, 12, 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontSize: 11, color: Colors.black54)),
          const SizedBox(height: 3),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color(0xFFF7F7F7),
              border: Border.all(color: const Color(0xFFE0E0E0)),
            ),
            child: Text(value, style: const TextStyle(color: Colors.black87)),
          ),
        ],
      ),
    );
  }
}

class _MainButton extends StatelessWidget {
  final String text;

  const _MainButton({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xFFFFBE19),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(fontWeight: FontWeight.w700),
      ),
    );
  }
}

class _DarkButton extends StatelessWidget {
  final String text;

  const _DarkButton({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
          colors: [Color(0xFF23354A), Color(0xFF435D7D)],
        ),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
      ),
    );
  }
}

class _SocialButton extends StatelessWidget {
  final String text;

  const _SocialButton({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFE6E6E6)),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 12),
      ),
    );
  }
}

class _MapPin extends StatelessWidget {
  final double top;
  final double left;
  final String emoji;

  const _MapPin({required this.top, required this.left, required this.emoji});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      child: CircleAvatar(
        radius: 18,
        backgroundColor: const Color(0xFFFFBE19),
        child: Text(emoji),
      ),
    );
  }
}

class _ChipLabel extends StatelessWidget {
  final String label;

  const _ChipLabel({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF3D9),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: const Color(0xFFECCB82)),
      ),
      child: Text(label, style: const TextStyle(fontSize: 12)),
    );
  }
}
