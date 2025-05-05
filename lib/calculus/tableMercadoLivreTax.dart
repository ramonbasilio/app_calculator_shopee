class Tablemercadolivretax {
  double taxMercadoLivreFull(double weight){
    if(weight <= 0.3){
      return 19.95;
    }
    if(weight > 0.3 && weight > 0.5){
      return 21.45;
    }
    if(weight > 0.501 && weight > 1){
      return 22.45;
    }
    else{
      return 100.0;
    }
  }
}