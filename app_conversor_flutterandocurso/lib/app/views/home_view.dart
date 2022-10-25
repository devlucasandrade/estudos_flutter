import 'package:fluterando_conversor_curso/app/components/currency_box.dart';
import 'package:fluterando_conversor_curso/app/controllers/home_controller.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController toText = TextEditingController();
  final TextEditingController fromText = TextEditingController();

  late HomeController homeController;

  @override
  void initState() {
    super.initState();
    homeController = HomeController(toText: toText, fromText: fromText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding:
              const EdgeInsets.only(top: 80, left: 20, right: 20, bottom: 20),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Image.asset(
                'assets/images/logo.png',
                width: 150,
                height: 150,
              ),
              const SizedBox(height: 20),
              CurrencyBox(
                selectedItem: homeController.toCurrency,
                items: homeController.currencies,
                onChanged: (model) {
                  setState(() {
                    model = homeController.toCurrency;
                  });
                },
                controller: toText,
              ),
              const SizedBox(height: 20),
              CurrencyBox(
                selectedItem: homeController.fromCurrency,
                items: homeController.currencies,
                controller: fromText,
                onChanged: (model) {
                  setState(() {
                    model = homeController.fromCurrency;
                  });
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.amber.shade700,
                ),
                onPressed: () {
                  homeController.convert();
                },
                child: const Text(
                  'CONVERTER',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
