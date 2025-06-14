class Tablemercadolivretax {
  double? taxMercadoLivreFull(double weight) {
    if (weight <= 0.3) {
      return 19.95;
    }
    if (weight > 0.3 && weight <= 0.5) {
      return 21.45;
    }
    if (weight > 0.501 && weight < 1) {
      return 22.45;
    }
    if (weight >= 1 && weight < 2) {
      return 23.45;
    }
    if (weight >= 2 && weight < 3) {
      return 24.45;
    }
    if (weight >= 3 && weight < 4) {
      return 26.45;
    }
    if (weight >= 4 && weight < 5) {
      return 28.45;
    }
    if (weight >= 5 && weight < 9) {
      return 44.45;
    }
    if (weight >= 9 && weight < 13) {
      return 65.95;
    }
    if (weight >= 13 && weight < 17) {
      return 73.95;
    }
    if (weight >= 17 && weight < 23) {
      return 85.95;
    }
    if (weight >= 23 && weight < 30) {
      return 98.95;
    }
    if (weight >= 30 && weight < 40) {
      return 101.95;
    }
    if (weight >= 40 && weight < 50) {
      return 105.95;
    }
    if (weight >= 50 && weight < 60) {
      return 112.95;
    }
    if (weight >= 60 && weight < 70) {
      return 112.95;
    }
    if (weight >= 70 && weight < 80) {
      return 125.95;
    }
    if (weight >= 80 && weight < 90) {
      return 139.95;
    }
    if (weight >= 90 && weight < 100) {
      return 159.95;
    }
    if (weight >= 100 && weight < 125) {
      return 178.95;
    }
    if (weight >= 125 && weight < 150) {
      return 189.90;
    }
    if (weight >= 150) {
      return 249.95;
    }
    return null;
  }
}
