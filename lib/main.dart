import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'presentation/splash/splash_screen.dart';

Future<
  void
>
main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // ✅ REQUIRED – fixes NotInitializedError
  await dotenv.load(
    fileName: ".env",
  );

  runApp(
    const MyApp(),
  );
}

class MyApp
    extends
        StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return MaterialApp(
      title: 'Agentic Flutter Starter Kit',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              vertical: 14,
              horizontal: 24,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                12,
              ),
            ),
          ),
        ),
      ),

      // ✅ Splash → Home → Settings flow
      home: const StartScreen(),
    );
  }
}
