import 'package:flutter/material.dart';

class XacDinhViTriScreen extends StatelessWidget {
  const XacDinhViTriScreen({super.key});

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
          decoration: BoxDecoration(
            gradient: bgGradient,
          ),
          child: Stack(
            children: [
              const SizedBox(height: 100),
              Padding(
                padding: const EdgeInsets.only(top: 100, left: 16, right: 16),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: SizedBox(
                    height: 250,
                    width: double.infinity,
                    child: InteractiveViewer(
                      minScale: 1.0,
                      maxScale: 4.0,
                      panEnabled: true,
                      child: Image.asset(
                        'assets/imgs/location.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 40),

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

              const Positioned(
                top: 20,
                left: 0,
                right: 0,
                child: Center(
                  child: Text(
                    "Chọn vị trí",
                    style: TextStyle(
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
                      const Text(
                        "Xác Định Vị Trí Của Bạn\n",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 60, 160, 222),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Ứng dụng sẽ hiển thị thời tiết tương ứng với vị trí của bạn.\n"
                        "Nhấn Xác nhận để tiếp tục.",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 40),

                      /// Button -> sang main app
                      // Nút xác nhận vị trí
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/thoitietchinh');
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 40,
                            vertical: 14,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFC107),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const Text(
                            'Xác nhận vị trí',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
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
