import 'package:flutter/material.dart';
import 'package:weather_app/l10n/app_localizations.dart';
import 'package:weather_app/screens/gioithieu1.dart'; // 🔹 thêm import này nếu chưa có

class ModauScreen extends StatelessWidget {
  const ModauScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Gradient bgGradient = const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color.fromARGB(255, 4, 102, 239),
        Color.fromARGB(255, 60, 160, 222),
        Color.fromARGB(255, 218, 227, 234),
      ],
      stops: [0.0, 0.6, 1.0],
    );

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(gradient: bgGradient),
          child: Stack(
            children: [
              // Positioned illustration near top
              Positioned(
                top: 35,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    Image.asset(
                      'assets/imgs/icon1.png',
                      width: 400,
                      height: 400,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ),

              // Content at bottom: title + button
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 28.0,
                    vertical: 36.0,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Title: 2 lines, different styles
                      Text(
                        AppLocalizations.of(context)!.splashLine1,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 38,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                          shadows: [
                            Shadow(
                              color: Colors.black.withOpacity(0.25),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        AppLocalizations.of(context)!.splashLine2,
                        style: TextStyle(
                          color: const Color(0xFFFFC107), // warm yellow
                          fontSize: 40,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.6,
                        ),
                      ),

                      const SizedBox(height: 28),

                      // CTA button
                      SizedBox(
                        width: 200,
                        height: 52,
                        child: ElevatedButton(
                          onPressed: () {
                            // 🔹 Thêm hiệu ứng fade transition
                            Navigator.of(context).push(
                              PageRouteBuilder(
                                transitionDuration:
                                    const Duration(milliseconds: 800),
                                pageBuilder: (context, animation,
                                    secondaryAnimation) {
                                  return const GioiThieu1Screen();
                                },
                                transitionsBuilder: (context, animation,
                                    secondaryAnimation, child) {
                                  return FadeTransition(
                                    opacity: animation,
                                    child: child,
                                  );
                                },
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFF3C200), // yellow
                            elevation: 8,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            shadowColor: Colors.black.withOpacity(0.3),
                          ),
                          child: Text(
                            AppLocalizations.of(context)!.start,
                            style: const TextStyle(
                              color: Color(0xFF2A2A6A), // dark text on yellow
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
