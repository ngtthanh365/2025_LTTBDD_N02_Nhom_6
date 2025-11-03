import 'package:flutter/material.dart';
import 'package:weather_app/l10n/app_localizations.dart';
import 'package:weather_app/screens/gioithieu4.dart';

class GioiThieu3Screen extends StatelessWidget {
  const GioiThieu3Screen({super.key});

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
              /// Ảnh icon
              Center(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Image.asset(
                      'assets/imgs/gioithieu2.png',
                      width: 400,
                    ),
                  ),
                ),
              ),

              Positioned(
                top: 20,
                left: 20,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context); // Quay lại trang trước
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 22,
                  ),
                ),
              ),

              Positioned(
                top: 20,
                right: 20,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/xacdinhvitri');
                  },
                  child: Text(
                    AppLocalizations.of(context)!.skip,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              /// Nội dung
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 40,
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(250),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.intro3Title,
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 60, 160, 222),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        AppLocalizations.of(context)!.intro3Desc,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 40),

                      /// Button -> sang main app
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            PageRouteBuilder(
                              transitionDuration: const Duration(
                                milliseconds: 600,
                              ),
                              pageBuilder:
                                  (context, animation, secondaryAnimation) {
                                    return const GioiThieu4Screen();
                                  },
                              transitionsBuilder:
                                  (
                                    context,
                                    animation,
                                    secondaryAnimation,
                                    child,
                                  ) {
                                    const begin = Offset(
                                      1.0,
                                      0.0,
                                    ); // từ phải sang
                                    const end = Offset.zero;
                                    const curve = Curves.easeOutCubic;

                                    final tween = Tween(
                                      begin: begin,
                                      end: end,
                                    ).chain(CurveTween(curve: curve));

                                    return SlideTransition(
                                      position: animation.drive(tween),
                                      child: child,
                                    );
                                  },
                            ),
                          );
                        },
                        child: Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color.fromARGB(255, 60, 160, 222),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.15),
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.arrow_forward_rounded,
                            size: 30,
                            color: Colors.white,
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
