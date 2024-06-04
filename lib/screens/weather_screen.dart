import 'package:flutter/material.dart';
import 'package:portfolio/widgets/kf_drawer.dart';
import 'package:portfolio/services/weather_service.dart';
import 'package:portfolio/constants/colors.dart' as constants;

// ignore: must_be_immutable
class WeatherScreen extends KFDrawerContent {
  WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherScreen> {
  final WeatherService _weatherService = WeatherService();
  final TextEditingController _cityController = TextEditingController();
  Map<String, dynamic>? _weatherData;
  bool _isLoading = false;

  Future<void> _getWeather() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final data = await _weatherService.fetchWeather(_cityController.text);
      setState(() {
        _weatherData = data;
      });
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to fetch weather data')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: widget.onMenuPressed,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 8),
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration: BoxDecoration(
                    color: constants.veryLightBeige,
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: _cityController,
                  decoration: const InputDecoration(
                    hintText: 'Enter city name',
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                margin: const EdgeInsets.only(top: 32, bottom: 6),
                width: MediaQuery.of(context).size.width,
                height: 60,
                child: ElevatedButton(
                  onPressed: _getWeather,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    backgroundColor: constants.darkBlue,
                  ),
                  child: const Text(
                    'Get Weather',
                    style: TextStyle(
                      color: constants.bgColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              _isLoading
                  ? const CircularProgressIndicator()
                  : _weatherData != null
                      ? Expanded(
                          child: ListView(
                            children: <Widget>[
                              Text(
                                'City: ${_weatherData!['name']}',
                                style: const TextStyle(fontSize: 18),
                              ),
                              Text(
                                'Temperature: ${(_weatherData!['main']['temp'] - 273.15).toStringAsFixed(2)}°C',
                                style: const TextStyle(fontSize: 18),
                              ),
                              Text(
                                'Weather: ${_weatherData!['weather'][0]['description']}',
                                style: const TextStyle(fontSize: 18),
                              ),
                              // Add more weather details if needed
                            ],
                          ),
                        )
                      : const Text('Enter a city name and press Get Weather'),
            ],
          ),
        ),
      ),
    );
  }
}
