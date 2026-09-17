import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  /// Cifras (Azeret Mono).
  static const cifras = TextStyle(fontFamily: 'monospace');

  static const label = TextStyle(fontSize: 11, color: AppColors.lima);

  static const saldoDisponible = TextStyle(
    fontSize: 52,
    color: AppColors.texto,
    fontWeight: FontWeight.w500,
  );

  static const usoResumen = TextStyle(fontSize: 12);

  static const heroTitulo = TextStyle(fontSize: 11, color: AppColors.muted);
  static const heroValor = TextStyle(fontSize: 19);

  static const seccionTitulo = TextStyle(fontSize: 20);
  static const verTodo = TextStyle(fontSize: 13, color: AppColors.lima);

  static const movimientoTitulo = TextStyle(color: AppColors.texto);
  static const movimientoSubtitulo = TextStyle(color: AppColors.muted);
  static const movimientoFecha = TextStyle(fontSize: 10, color: AppColors.muted);
}
