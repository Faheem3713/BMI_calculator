import 'dart:math';

class Calculation {
  Calculation({required this.height, required this.weight});
  final int height;
  final int weight;
  late double bmi;
  String calcuBMI() {
    // ignore: unused_local_variable
    bmi = weight / pow(height / 100, 2);
    return bmi.toStringAsFixed(1);
  }

  String interpretation() {
    if (bmi >= 25) {
      return ('Poyi thadi korkk..!');
    } else if (bmi > 18.5) {
      return ('Mm ushaar...!');
    } else {
      return ('Ntha mone pattini aano...?');
    }
  }

  String getResult() {
    if (bmi >= 25) {
      return ('HEIGH..');
    } else if (bmi > 18.5) {
      return ('NORMAL..');
    } else {
      return ('LOW..');
    }
  }
}
