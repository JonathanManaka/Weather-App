class ResponseMessage {
  //weather animation -- Returns weather annimation according to the weather condition
  static String getWeatherAnimation(String? WeatherCondition) {
    if (WeatherCondition == null) {
      return "assets/loading.json";
    }
    switch (WeatherCondition.toLowerCase()) {
      case 'clouds':
        return "assets/Cloudy-animation.json";
      case 'mist':
      case 'smoke':
      case 'haze':
      case 'dust':
      case 'fog':
        return "assets/Cloudy-animation.json";
      case 'rain':
        return "assets/rainy.json";
      case 'drizzle':
        return "assets/PartlyShower-animation.json";
      case 'shower rain':
      case 'thunderstorm':
        return "assets/WeatherStorm-animation.json";
      case 'clear':
        return "assets/Sunny-animation.json";

      default:
        return "assets/loading.json";
    }
  }

  //Status annimation
  static String getWeatherStatusAnnimation(String? weatherCondition) {
    if (weatherCondition == null) {
      return "assets/loading.json";
    }
    switch (weatherCondition.toLowerCase()) {
      case 'clouds':
        return "assets/rainccoat.json";
      case 'mist':
        return "assets/mist.json";
      case 'smoke':
      case 'haze':
      case 'dust':
      case 'fog':
        return "assets/foggy_weather.json";
      case 'rain':
        return "assets/umbrella-rainning.json";
      case 'drizzle':
        return "assets/PartlyShower-animation.json";
      case 'shower rain':
      case 'thunderstorm':
        return "assets/storm.json";
      case 'clear':
        return "assets/clear_night.json";

      default:
        return "assets/loading.json";
    }
  }
}
