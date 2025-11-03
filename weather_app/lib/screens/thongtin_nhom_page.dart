import 'package:flutter/material.dart';
import 'package:weather_app/l10n/app_localizations.dart';

class ThongTinNhomPage extends StatelessWidget {
  const ThongTinNhomPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.teamInfo,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity, // ✅ đảm bảo phủ kín toàn màn hình
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 4, 102, 239),
              Color.fromARGB(255, 60, 160, 222),
              Color.fromARGB(255, 218, 227, 234),
            ],
            stops: [0.0, 0.6, 1.0],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          bottom: false, // ✅ không chừa viền trắng phía dưới
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                const SizedBox(height: 15),

                // 🌟 Tiêu đề
                Text(
                  AppLocalizations.of(context)!.groupHeader,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.8,
                  ),
                ),

                const SizedBox(height: 35),

                // 🧑‍💻 Thành viên 1
                _buildThanhVienCard(
                  context,
                  name: "Nguyễn Huy Hoàng",
                  mssv: "23010143",
                  lop: "K17_CNTT2",
                  email: "23010143@st.phenikaa-uni.edu.vn",
                  role: AppLocalizations.of(context)!.memberRole,
                  image:
                      "https://cdn-icons-png.flaticon.com/512/3135/3135715.png",
                ),

                const SizedBox(height: 25),

                // 👩‍💻 Thành viên 2
                _buildThanhVienCard(
                  context,
                  name: "Nguyễn Tuấn Thành",
                  mssv: "23010626",
                  lop: "K17_CNTT7",
                  email: "23010626@st.phenikaa-uni.edu.vn",
                  role: AppLocalizations.of(context)!.memberRole,
                  image:
                      "https://cdn-icons-png.flaticon.com/512/219/219970.png",
                ),

                const SizedBox(height: 40),

                // 🎓 Footer
                AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(color: Colors.white30, width: 1),
                  ),
                  child: Text(
                    AppLocalizations.of(context)!.footer,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // 🟦 Hàm dựng thẻ thông tin thành viên (đẹp & có hiệu ứng bóng)
  Widget _buildThanhVienCard(
    BuildContext context, {
    required String name,
    required String mssv,
    required String lop,
    required String email,
    required String role,
    required String image,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.96),
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.blueAccent.withOpacity(0.3),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Ảnh đại diện với khung tròn
          Container(
            padding: const EdgeInsets.all(3),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [Color(0xFF3A7BD5), Color(0xFF00D2FF)],
              ),
            ),
            child: CircleAvatar(
              radius: 38,
              backgroundImage: NetworkImage(image),
            ),
          ),

          const SizedBox(width: 16),

          // Thông tin
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Color(0xFF003366),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  role,
                  style: const TextStyle(
                    color: Colors.blueGrey,
                    fontStyle: FontStyle.italic,
                    fontSize: 15,
                  ),
                ),
                const Divider(height: 16, color: Colors.blueAccent),
                Text(
                  "📘 ${AppLocalizations.of(context)!.mssvLabel}: $mssv",
                  style: const TextStyle(fontSize: 15, color: Colors.black87),
                ),
                Text(
                  "🏫 ${AppLocalizations.of(context)!.classLabel}: $lop",
                  style: const TextStyle(fontSize: 15, color: Colors.black87),
                ),
                Text(
                  "📧 ${AppLocalizations.of(context)!.emailLabel}: $email",
                  style: const TextStyle(fontSize: 15, color: Colors.black87),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
