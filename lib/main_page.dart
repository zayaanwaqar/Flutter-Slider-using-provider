import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'main_page_provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  double valOfSlider = 0.1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: ChangeNotifierProvider<MainPageProvider>(
            create: (context) => MainPageProvider(),
            child: Consumer<MainPageProvider>(
              builder: (context, provider, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Video Progress \n${provider.value?.toStringAsFixed(2)}',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),textAlign: TextAlign.center,
                    ),
                    Slider(
                      max: 100,
                      value: valOfSlider,
                      onChanged: (double val) {
                        provider.getValue(val);
                        valOfSlider = provider.value!;
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
