import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:password_generator/misc/colors_app.dart';
import 'package:provider/provider.dart';

import '../../../domain/provider/password_generator_provide.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double displayHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(19, 18, 25, 1),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.only(left: 20.0, right: 20, top: displayHeight * 0.09),
          child: Column(
            children: [
              const Text('Password Generator',
                  style: TextStyle(
                      color: Color.fromRGBO(134, 131, 150, 1), fontSize: 20)),
              const SizedBox(height: 30),
              const PasswordContainer(),
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                color: ColorsApp.primaryColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Column(
                    children: const [
                      SliderLength(),
                      CheckBoxSelect(
                          text: 'Include Uppercase Letters', number: 1),
                      CheckBoxSelect(
                          text: 'Include Lowercase Letters', number: 2),
                      CheckBoxSelect(text: 'Include Numbers', number: 3),
                      CheckBoxSelect(text: 'Include Symbols', number: 4),
                      SizedBox(height: 20),
                      PasswordStrength(),
                      SizedBox(height: 25),
                      ButtonGenerator(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}

class ButtonGenerator extends StatefulWidget {
  const ButtonGenerator({
    Key? key,
  }) : super(key: key);

  @override
  State<ButtonGenerator> createState() => _ButtonGeneratorState();
}

class _ButtonGeneratorState extends State<ButtonGenerator> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: MaterialButton(
        height: 60,
        color: ColorsApp.secondaryColor,
        onPressed: () {
          var passwordProvider = context.read<PasswordProvider>();
          if (passwordProvider.isLowerCase ||
              passwordProvider.isUpperCase ||
              passwordProvider.isNumbers ||
              passwordProvider.isSymbols) {
            passwordProvider.generatePassword();
            passwordProvider.determinePasswordStrength();
          } else {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Select at least one option'),
              backgroundColor: Colors.red,
            ));
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'GENERATE',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            SizedBox(width: 4),
            Icon(Icons.arrow_forward_rounded)
          ],
        ),
      ),
    );
  }
}

class PasswordStrength extends StatelessWidget {
  const PasswordStrength({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var passwordProvider = context.watch<PasswordProvider>();
    int strength = passwordProvider.strengthLevel;
    String valorText() {
      switch (strength) {
        case 0:
          return '';
        case 1:
          return 'WEAK';
        case 2:
          return 'MEDIUM';
        case 3:
          return 'STRONG';
        case 4:
          return 'VERY STRONG';
        default:
          return '';
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Container(
        width: double.infinity,
        height: 60,
        color: const Color.fromRGBO(19, 18, 25, 1),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17.0, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'STRENGTH',
                style: TextStyle(color: Color.fromRGBO(139, 136, 155, 1)),
              ),
              Row(
                children: [
                  Text(valorText(),
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w700)),
                  const SizedBox(width: 16),
                  buildWidgetBasedOnValue(strength)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildWidgetBasedOnValue(int value) {
  Color color1 = Colors.white;
  Color color2 = Colors.white;
  Color color3 = Colors.white;
  Color color4 = Colors.white;
  switch (value) {
    case 1:
      color1 = Colors.greenAccent;
      break;
    case 2:
      color1 = Colors.greenAccent;
      color2 = const Color.fromARGB(255, 210, 255, 64);
      break;
    case 3:
      color1 = Colors.greenAccent;
      color2 = const Color.fromARGB(255, 210, 255, 64);
      color3 = Colors.orangeAccent;
      break;
    case 4:
      color1 = Colors.greenAccent;
      color2 = const Color.fromARGB(255, 210, 255, 64);
      color3 = Colors.orangeAccent;
      color4 = Colors.redAccent;
      break;
  }
  return Row(children: [
    Padding(
      padding: const EdgeInsets.only(left: 6.0),
      child: Container(
        width: 13,
        height: double.infinity,
        decoration: BoxDecoration(
            color: color1 == Colors.white ? Colors.transparent : color1,
            border: Border.all(
                color: color1 == Colors.white ? color1 : Colors.transparent,
                width: 2)),
      ),
    ),
    Padding(
      padding: const EdgeInsets.only(left: 6.0),
      child: Container(
        width: 13,
        height: double.infinity,
        decoration: BoxDecoration(
            color: color2 == Colors.white ? Colors.transparent : color2,
            border: Border.all(
                color: color2 == Colors.white ? color2 : Colors.transparent,
                width: 2)),
      ),
    ),
    Padding(
      padding: const EdgeInsets.only(left: 6.0),
      child: Container(
        width: 13,
        height: double.infinity,
        decoration: BoxDecoration(
            color: color3 == Colors.white ? Colors.transparent : color3,
            border: Border.all(
                color: color3 == Colors.white ? color3 : Colors.transparent,
                width: 2)),
      ),
    ),
    Padding(
      padding: const EdgeInsets.only(left: 6.0),
      child: Container(
        width: 13,
        height: double.infinity,
        decoration: BoxDecoration(
            color: color4 == Colors.white ? Colors.transparent : color4,
            border: Border.all(
                color: color4 == Colors.white ? color4 : Colors.transparent,
                width: 2)),
      ),
    )
  ]);
}

class CheckBoxSelect extends StatefulWidget {
  /* [
    1=Uppercase
    2=Lowercase
    3=Numbers
    4=Symbols
  ] */
  final int number;
  final String text;

  const CheckBoxSelect({super.key, required this.text, required this.number});

  @override
  State<CheckBoxSelect> createState() => _CheckBoxSelectState();
}

class _CheckBoxSelectState extends State<CheckBoxSelect> {
  void handleCheckboxSelection(int number) {
    switch (number) {
      case 1:
        context.read<PasswordProvider>().setIsUpperCase();
        break;
      case 2:
        context.read<PasswordProvider>().setIsLowerCase();
        break;
      case 3:
        context.read<PasswordProvider>().setIsNumbers();
        break;
      case 4:
        context.read<PasswordProvider>().setIsSymbols();
        break;
      default:
        break;
    }
  }

  bool checkboxSelection(int number) {
    bool checkboxValue = false;
    switch (number) {
      case 1:
        checkboxValue = context.watch<PasswordProvider>().isUpperCase;
        break;
      case 2:
        checkboxValue = context.watch<PasswordProvider>().isLowerCase;
        break;
      case 3:
        checkboxValue = context.watch<PasswordProvider>().isNumbers;
        break;
      case 4:
        checkboxValue = context.watch<PasswordProvider>().isSymbols;
        break;
      default:
        break;
    }
    return checkboxValue;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: checkboxSelection(widget.number),
          onChanged: (bool? value) {
            handleCheckboxSelection(widget.number);
          },
          fillColor: MaterialStateProperty.all<Color>(ColorsApp.secondaryColor),
          checkColor: const Color.fromRGBO(19, 18, 25, 1),
          activeColor: ColorsApp.secondaryColor,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Text(widget.text,
                style: const TextStyle(color: Colors.white, fontSize: 17)),
          ),
        )
      ],
    );
  }
}

class SliderLength extends StatefulWidget {
  const SliderLength({
    super.key,
  });

  @override
  State<SliderLength> createState() => _SliderLengthState();
}

class _SliderLengthState extends State<SliderLength> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Character Length',
                  style: TextStyle(color: Colors.white, fontSize: 17)),
              Text(context.watch<PasswordProvider>().sliderLength.toString(),
                  style: const TextStyle(
                      color: ColorsApp.secondaryColor, fontSize: 20))
            ],
          ),
        ),
        Slider(
          value: context.watch<PasswordProvider>().sliderLength.toDouble(),
          min: 4,
          max: 20,
          activeColor: ColorsApp.secondaryColor,
          inactiveColor: const Color.fromRGBO(19, 18, 25, 1),
          onChanged: (double value) {
            context.read<PasswordProvider>().setSliderLength(value.toInt());
          },
        ),
        const SizedBox(height: 10.0),
      ],
    );
  }
}

class PasswordContainer extends StatefulWidget {
  const PasswordContainer({
    super.key,
  });

  @override
  State<PasswordContainer> createState() => _PasswordContainerState();
}

class _PasswordContainerState extends State<PasswordContainer> {
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _passwordController.text = context.watch<PasswordProvider>().password;
    return Container(
        width: double.infinity,
        height: 60,
        color: ColorsApp.primaryColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  enabled: false,
                  controller: _passwordController,
                  cursorColor: ColorsApp.secondaryColor,
                  style: const TextStyle(fontSize: 19, color: Colors.white),
                  decoration: const InputDecoration(
                      disabledBorder: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 20),
                      hintText: 'Password',
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 145, 145, 145)),
                      border: InputBorder.none),
                ),
              ),
              IconButton(
                  splashRadius: 2,
                  onPressed: () {
                    FlutterClipboard.copy(
                        _passwordController.value.text.toString());

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        duration: Duration(seconds: 2),
                        behavior: SnackBarBehavior.floating,
                        animation: AlwaysStoppedAnimation(
                            BorderSide.strokeAlignInside),
                        content: Text('Copied'),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.copy,
                    color: ColorsApp.secondaryColor,
                  ))
            ],
          ),
        ));
  }
}
