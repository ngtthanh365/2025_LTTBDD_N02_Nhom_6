import 'package:flutter/material.dart';
import 'package:weather_app/screens/weather_preview_screen.dart';

class TimKiemThanhPho extends StatefulWidget {
  const TimKiemThanhPho({super.key});

  @override
  State<TimKiemThanhPho> createState() => _TimKiemThanhPhoState();
}

class _TimKiemThanhPhoState extends State<TimKiemThanhPho> {
  final TextEditingController _controller = TextEditingController();

  final List<Map<String, dynamic>> cities = [
    {"name": "Hà Nội", "temp": 28, "min": 21, "max": 30, "status": "Nhiều mây - 28°C"},
    {"name": "Hưng Yên", "temp": 21, "min": 19, "max": 23, "status": "Mưa rào"},
    {"name": "Đà Nẵng", "temp": 30, "min": 25, "max": 33, "status": "Nắng nhẹ"},
    {
      "name": "TP. Hồ Chí Minh",
      "temp": 32,
      "min": 27,
      "max": 34,
      "status": "Nắng nóng",
    },
  ];

  List<Map<String, dynamic>> filteredCities = [];

  @override
  void initState() {
    super.initState();
    filteredCities = cities;
  }

  void _filterCities(String query) {
    setState(() {
      filteredCities = cities
          .where(
            (city) => city['name'].toLowerCase().contains(query.toLowerCase()),
          )
          .toList();
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
      backgroundColor: Colors.blue[900],
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 22),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Thêm thành phố',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 60, 160, 222),
        elevation: 2, // tạo hiệu ứng nổi nhẹ
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
                hintText: "Nhập tên thành phố...",
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
          Expanded(
            child: ListView.builder(
              itemCount: filteredCities.length,
              itemBuilder: (context, index) {
                final city = filteredCities[index];
                return ListTile(
                  title: Text(
                    city['name'],
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  subtitle: Text(
                    city['status'],
                    style: const TextStyle(color: Colors.white70),
                  ),
                  trailing: const Icon(
                    Icons.chevron_right,
                    color: Colors.white,
                  ),
                  onTap: () => _showCityPreview(city),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
