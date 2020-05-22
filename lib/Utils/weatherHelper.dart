class WeatherHelper {
  static String getClockInUtcPlus3Hours(int timeSinceEpochInSec) {
    final time = DateTime.fromMillisecondsSinceEpoch(timeSinceEpochInSec * 1000,
        isUtc: true)
        .add(const Duration(hours: 3));
    return '${time.hour}:${time.second}';
  }

  static String formatRain(double rain) {
    return "${rain.toStringAsFixed(2)} mm/h";
  }


  static String formatHumidity(double humidity) {
    return "${humidity.toStringAsFixed(0)}%";
  }
}