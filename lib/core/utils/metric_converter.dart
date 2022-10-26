class MetricConverter {
  static double? toCelcius(dynamic d) {
    if (d == null) return null;

    if (d is double) {
      double data = d - 273.15;
      return data.ceilToDouble();
    }

    return null;
  }
}
