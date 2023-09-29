import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'domain/provider/password_generator_provide.dart';
import 'ui/app.dart';

void main(List<String> args) => runApp(
      ChangeNotifierProvider(
        create: (_) => PasswordProvider(),
        child: const App(),
      ),
    );
