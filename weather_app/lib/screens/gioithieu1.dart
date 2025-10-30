import 'package:flutter/material.dart';

class GioiThieu1Screen extends StatelessWidget {
  const GioiThieu1Screen({super.key});

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
            borderRadius: BorderRadius.circular(28),
          ),
          child: Stack(
            children: [
              /// Ảnh icon
            Center(
              child: Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Image.asset(
                    'assets/imgs/gioithieu1.png',
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

              const Positioned(
                top: 20,
                right: 20,
                child: Text(
                  "Bỏ qua",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ),

              /// Nội dung
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(250)),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "Dự Báo Theo Từng Giờ",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 60, 160, 222)),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Nhận thông tin thời tiết chuyên sâu.\n"
                        "Cập nhật theo từng giờ.",
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
                          Navigator.pushNamed(context, "/gioithieu2");
                        },
                        child: Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromARGB(255, 60, 160, 222), // Màu xanh dương nổi bật
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.15),
                                blurRadius: 8,
                                offset: Offset(0, 4),
                              )
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
