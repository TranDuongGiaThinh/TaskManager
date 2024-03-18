import 'package:flutter/material.dart';

class ChartsModel {
  static int countTotal = 0;
  
  final String description;
  final int count;
  final Color color;

  ChartsModel(this.description, this.count, this.color) {
    countTotal += count;
  }
}
