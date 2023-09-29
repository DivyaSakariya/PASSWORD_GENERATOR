import 'dart:math';
import 'package:flutter/material.dart';

class PasswordProvider with ChangeNotifier {
  int _sliderLength = 10;
  bool _isUpperCase = true;
  bool _isLowerCase = false;
  bool _isNumbers = false;
  bool _isSymbols = false;
  String _password = '';
  int _strengthLevel = 0;

  int get sliderLength => _sliderLength;
  bool get isUpperCase => _isUpperCase;
  bool get isLowerCase => _isLowerCase;
  bool get isNumbers => _isNumbers;
  bool get isSymbols => _isSymbols;
  String get password => _password;
  int get strengthLevel => _strengthLevel;

  void setSliderLength(int value) {
    _sliderLength = value;
    notifyListeners();
  }

  void setIsUpperCase() {
    _isUpperCase = !_isUpperCase;
    notifyListeners();
  }

  void setIsLowerCase() {
    _isLowerCase = !_isLowerCase;
    notifyListeners();
  }

  void setIsNumbers() {
    _isNumbers = !_isNumbers;
    notifyListeners();
  }

  void setIsSymbols() {
    _isSymbols = !_isSymbols;
    notifyListeners();
  }

  void generatePassword() {
    String uppercaseChars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    String lowercaseChars = 'abcdefghijklmnopqrstuvwxyz';
    String numberChars = '0123456789';
    String symbolChars = '!@#\$%^&*()';

    List<String> allowedChars = [];

    if (_isUpperCase) allowedChars.addAll(uppercaseChars.split(''));
    if (_isLowerCase) allowedChars.addAll(lowercaseChars.split(''));
    if (_isNumbers) allowedChars.addAll(numberChars.split(''));
    if (_isSymbols) allowedChars.addAll(symbolChars.split(''));

    if (allowedChars.isEmpty) {
      throw Exception(
          'No se proporcionaron opciones válidas para generar la contraseña.');
    }

    Random random = Random();
    String password = '';

    // Generar caracteres requeridos
    if (_isUpperCase) {
      int randomIndex = random.nextInt(uppercaseChars.length);
      password += uppercaseChars[randomIndex];
    }
    if (_isLowerCase) {
      int randomIndex = random.nextInt(lowercaseChars.length);
      password += lowercaseChars[randomIndex];
    }
    if (_isNumbers) {
      int randomIndex = random.nextInt(numberChars.length);
      password += numberChars[randomIndex];
    }
    if (_isSymbols) {
      int randomIndex = random.nextInt(symbolChars.length);
      password += symbolChars[randomIndex];
    }

    // Generar caracteres restantes
    int remainingLength = _sliderLength - password.length;
    for (int i = 0; i < remainingLength; i++) {
      int randomIndex = random.nextInt(allowedChars.length);
      password += allowedChars[randomIndex];
    }

    _password = password;
    notifyListeners();
  }

  void changePassword(String password) {
    _password = password;
    notifyListeners();
  }

  void determinePasswordStrength() {
    int score = 0;

    if (password.length >= 8 && password.length <= 12) {
      score += 2;
    } else if (password.length > 12 && password.length <= 16) {
      score += 3;
    } else if (password.length > 16 && password.length <= 20) {
      score += 4;
    }

    // Comprobar si contiene letras mayúsculas y minúsculas
    if (password.contains(RegExp(r'[A-Z]')) &&
        password.contains(RegExp(r'[a-z]'))) {
      score += 2; // Sumar 2 puntos si contiene ambas
    }

    // Comprobar si contiene números
    if (password.contains(RegExp(r'[0-9]'))) {
      score += 2;
    }

    // Comprobar si contiene símbolos especiales
    if (password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      score += 2;
    }

    if (score <= 5) {
      _strengthLevel = 1;
    } else if (score <= 7) {
      _strengthLevel = 2;
    } else if (score <= 9) {
      _strengthLevel = 3;
    } else {
      _strengthLevel = 4;
    }
    notifyListeners();
  }
}
