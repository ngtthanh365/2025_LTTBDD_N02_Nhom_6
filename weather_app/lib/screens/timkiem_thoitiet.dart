import 'package:flutter/material.dart';
import 'package:weather_app/screens/weather_preview_screen.dart';
import 'package:weather_app/l10n/app_localizations.dart';

class TimKiemThanhPho extends StatefulWidget {
  const TimKiemThanhPho({super.key});

  @override
  State<TimKiemThanhPho> createState() => _TimKiemThanhPhoState();
}

class _TimKiemThanhPhoState extends State<TimKiemThanhPho> {
  final TextEditingController _controller = TextEditingController();

  final List<Map<String, dynamic>> cities = [
    {
      "name": "Hà Nội",
      "temp": 18,
      "min": 18,
      "max": 21,
      "status": "Nhiều mây",
      "icon": "assets/imgs/gioithieu4.png",
    },
    {
      "name": "Hưng Yên",
      "temp": 21,
      "min": 19,
      "max": 23,
      "status": "Mưa rào",
      "icon": "assets/imgs/icon1.png",
    },
    {
      "name": "Đà Nẵng",
      "temp": 30,
      "min": 25,
      "max": 33,
      "status": "Âm u",
      "icon": "assets/imgs/demgio.png",
    },
    {
      "name": "TP. Hồ Chí Minh",
      "temp": 32,
      "min": 27,
      "max": 34,
      "status": "Nắng nóng",
      "icon": "assets/imgs/gioithieu2.png",
    },
    {
      "name": "Nam Định",
      "temp": 20,
      "min": 18,
      "max": 21,
      "status": "Mưa rào",
      "icon": "assets/imgs/demmua.png",
    },
    {
      "name": "Thanh Hóa",
      "temp": 25,
      "min": 22,
      "max": 27,
      "status": "Giông bão",
      "icon": "assets/imgs/samset.png",
    },
    {
      "name": "New York",
      "temp": 12,
      "min": 6,
      "max": 16,
      "status": "Trời quang mây",
      "icon": "assets/imgs/bao.png",
    },
    {
      "name": "Seoul",
      "temp": 12,
      "min": -1,
      "max": 13,
      "status": "Có nắng",
      "icon": "assets/imgs/gioithieu4.png",
    },
    {
      "name": "London",
      "temp": 11,
      "min": 7,
      "max": 16,
      "status": "Mưa phùn",
      "icon": "assets/imgs/demmua.png",
    },
    {
      "name": "Ninh Bình",
      "temp": 22,
      "min": 23,
      "max": 19,
      "status": "Giông bão",
      "icon": "assets/imgs/samset.png",
    },
  ];

  List<Map<String, dynamic>> filteredCities = [];

  // Map Vietnamese status text (existing data) to a canonical key
  final Map<String, String> _viStatusToKey = {
    'Nhiều mây': 'cloudy',
    'Mưa rào': 'rain',
    'Âm u': 'overcast',
    'Nắng nóng': 'hot',
    'Giông bão': 'storm',
    'Trời quang mây': 'clear',
    'Có nắng': 'sunny',
    'Mưa phùn': 'drizzle',
  };

  // Translations for status keys
  final Map<String, Map<String, String>> _statusTranslations = {
    'cloudy': {'vi': 'Nhiều mây', 'en': 'Cloudy'},
    'rain': {'vi': 'Mưa rào', 'en': 'Showers'},
    'overcast': {'vi': 'Âm u', 'en': 'Overcast'},
    'hot': {'vi': 'Nắng nóng', 'en': 'Hot'},
    'storm': {'vi': 'Giông bão', 'en': 'Stormy'},
    'clear': {'vi': 'Trời quang mây', 'en': 'Clear skies'},
    'sunny': {'vi': 'Có nắng', 'en': 'Sunny'},
    'drizzle': {'vi': 'Mưa phùn', 'en': 'Light drizzle'},
  };

  String _localizedStatus(BuildContext context, String rawStatus) {
    final code = Localizations.localeOf(context).languageCode;
    // find canonical key from Vietnamese raw data or from raw english key
    String? key = _viStatusToKey[rawStatus];
    if (key == null) {
      // maybe rawStatus already in English; try to match by english values
      for (final entry in _statusTranslations.entries) {
        if (entry.value['en']?.toLowerCase() == rawStatus.toLowerCase() ||
            entry.value['vi'] == rawStatus) {
          key = entry.key;
          break;
        }
      }
    }
    if (key != null) {
      return _statusTranslations[key]?[code] ?? rawStatus;
    }
    return rawStatus; // fallback: show original
  }

  @override
  void initState() {
    super.initState();
    filteredCities = [];
  }

  void _filterCities(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredCities = []; // Khi không gõ gì → danh sách trống
      } else {
        filteredCities = cities
            .where(
              (city) =>
                  city['name'].toLowerCase().contains(query.toLowerCase()),
            )
            .toList();
      }
    });
  }

  void _showCityPreview(Map<String, dynamic> city) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => WeatherPreviewScreen(city: city)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF002B5B),
      appBar: AppBar(
        backgroundColor: const Color(0xFF002B5B),
        elevation: 2,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 22),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          AppLocalizations.of(context)!.addCityTitle,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        centerTitle: false, // ✅ Cho phép tiêu đề lệch trái (gần icon)
        titleSpacing: -8, // ✅ Giảm khoảng cách giữa icon và chữ
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _controller,
              onChanged: _filterCities,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: AppLocalizations.of(context)!.searchHint,
                hintStyle: const TextStyle(color: Colors.white60),
                prefixIcon: const Icon(Icons.search, color: Colors.white70),
                filled: true,
                fillColor: Colors.white.withOpacity(0.15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          // 🔹 Danh sách kết quả tìm kiếm
          Expanded(
            child: ListView.builder(
              itemCount: filteredCities.length,
              itemBuilder: (context, index) {
                final city = filteredCities[index];
                return GestureDetector(
                  onTap: () => _showCityPreview(city),
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        // 🟡 Icon thời tiết
                        Image.asset(
                          city['icon'],
                          width: 50,
                          height: 50,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(
                              Icons.wb_sunny,
                              color: Colors.yellow,
                              size: 40,
                            );
                          },
                        ),
                        const SizedBox(width: 16),

                        // 🟣 Tên và trạng thái
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                city['name'],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                _localizedStatus(context, city['status']),
                                style: const TextStyle(color: Colors.white70),
                              ),
                            ],
                          ),
                        ),

                        // 🔵 Nhiệt độ hiển thị bên phải
                        Text(
                          "${city['temp']}°C",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
