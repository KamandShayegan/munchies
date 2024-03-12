import 'package:flutter/material.dart';
import 'package:munch/cubit/app_cubits.dart';
import 'package:munch/utils/my_colors.dart';
import 'package:munch/widgets/large_texts.dart';
import 'package:munch/widgets/responsive_button.dart';
import 'package:munch/widgets/texts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List<String> images = ["welcome_1.JPG", "welcome_2.JPG", "welcome_3.JPG"];
  List<String> headers = ["Burger", "Sushi! YUM", "Pasta"];
  List<String> desc = [
    'Juicy and flavorful',
    'Either cooked or raw',
    'Handmade and fresh'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_, index) {
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("img/" + images[index]),
                ),
              ),
              child: Container(
                margin: const EdgeInsets.only(right: 16, left: 16, top: 96),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LargeText(text: headers[index]),
                        const SizedBox(height: 4),
                        H2Text(text: desc[index]),
                      ],
                    ),
                    Column(
                      children: [
                        ...List.generate(
                          3,
                          (dotIndex) => Container(
                            margin: const EdgeInsets.only(top: 4),
                            width: 8,
                            height: index == dotIndex ? 16 : 8,
                            decoration: BoxDecoration(
                                color: index == dotIndex
                                    ? MyColors.primary
                                    : MyColors.secondary,
                                borderRadius: BorderRadius.circular(8)),
                          ),
                        ).toList(),
                      ],
                    )
                  ],
                ),
              ),
            );
          }),
      floatingActionButton: ResponsiveButton(
        onTap: () {
          context.read<AppCubit>().setMainPage();
        },
      ),
    );
  }
}
