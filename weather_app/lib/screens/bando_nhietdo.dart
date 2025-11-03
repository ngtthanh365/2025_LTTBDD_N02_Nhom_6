import 'package:flutter/material.dart';
import 'package:weather_app/l10n/app_localizations.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class BanDoNhietDo extends StatefulWidget {
  const BanDoNhietDo({super.key});

  @override
  State<BanDoNhietDo> createState() => _BanDoNhietDoState();
}

class _BanDoNhietDoState extends State<BanDoNhietDo> {
  String selectedLayer = 'temp'; // 'temp','clouds','precipitation','wind'
  final String apiKey = '3dbbca1f68e3879dd16b29b4a1612162';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 22),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          AppLocalizations.of(context)!.mapTitle,
          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 60, 160, 222),
        elevation: 2, // tạo hiệu ứng nổi nhẹ
      ),
      body: Stack(
        children: [
          FlutterMap(
            options: const MapOptions(
              initialCenter: LatLng(21.0285, 105.8542),
              initialZoom: 6,
            ),
            children: [
              // Lớp bản đồ nền
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.weather_app',
              ),

              // Lớp nhiệt độ (overlay)
              Opacity(
                opacity: 0.72,
                child: TileLayer(
                  urlTemplate:
                      'https://tile.openweathermap.org/map/${selectedLayer}_new/{z}/{x}/{y}.png?appid=$apiKey',
                  userAgentPackageName: 'com.example.weather_app',
                ),
              ),
            ],
          ),

          // Thanh legend hiển thị khi chọn "nhiệt độ"
          if (selectedLayer == 'temp')
            Positioned(
              left: 15,
              top: 80,
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 60, 160, 222),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 5,
                      offset: const Offset(2, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.legendTemperature,
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    const SizedBox(height: 8),

                    // Dải màu và số hiển thị bên phải
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Dải màu
                        Container(
                          width: 20,
                          height: 150,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                Color(0xFF4A00E0), // Tím xanh
                                Color(0xFF0000FF), // Xanh
                                Color(0xFF00FFFF), // Xanh ngọc
                                Color(0xFFFFFF00), // Vàng
                                Color(0xFFFFA500), // Cam
                                Color(0xFFFF0000), // Đỏ
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),

                        // Cột số
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text('55', style: TextStyle(fontSize: 12)),
                            Text('30', style: TextStyle(fontSize: 12)),
                            Text('20', style: TextStyle(fontSize: 12)),
                            Text('10', style: TextStyle(fontSize: 12)),
                            Text('0', style: TextStyle(fontSize: 12)),
                            Text('-20', style: TextStyle(fontSize: 12)),
                            Text('-40', style: TextStyle(fontSize: 12)),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

          // Các nút chọn layer (nhiệt độ, mây, mưa, gió)
          Positioned(
            right: 10,
            top: 20,
            child: Column(
              children: [
                FloatingActionButton.small(
                  heroTag: 'temp',
                  backgroundColor: selectedLayer == 'temp'
                      ? Color.fromARGB(255, 60, 160, 222)
                      : Colors.grey.shade700,
                  onPressed: () => setState(() => selectedLayer = 'temp'),
                  child: const Icon(Icons.thermostat, color: Colors.white),
                ),
                const SizedBox(height: 10),

                FloatingActionButton.small(
                  heroTag: 'clouds',
                  backgroundColor: selectedLayer == 'clouds'
                      ? Color.fromARGB(255, 60, 160, 222)
                      : Colors.grey.shade700,
                  onPressed: () => setState(() => selectedLayer = 'clouds'),
                  child: const Icon(Icons.cloud, color: Colors.white),
                ),
                const SizedBox(height: 10),

                FloatingActionButton.small(
                  heroTag: 'precipitation',
                  backgroundColor: selectedLayer == 'precipitation'
                      ? Color.fromARGB(255, 60, 160, 222)
                      : Colors.grey.shade700,
                  onPressed: () =>
                      setState(() => selectedLayer = 'precipitation'),
                  child: const Icon(Icons.grain, color: Colors.white),
                ),
                const SizedBox(height: 10),

                FloatingActionButton.small(
                  heroTag: 'wind',
                  backgroundColor: selectedLayer == 'wind'
                      ? Color.fromARGB(255, 60, 160, 222)
                      : Colors.grey.shade700,
                  onPressed: () => setState(() => selectedLayer = 'wind'),
                  child: const Icon(Icons.air, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
