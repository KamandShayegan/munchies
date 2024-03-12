import 'package:flutter/material.dart';
import 'package:munch/cubit/app_cubits.dart';
import 'package:munch/utils/my_colors.dart';
import 'package:munch/widgets/buttons.dart';
import 'package:munch/widgets/large_texts.dart';
import 'package:munch/widgets/responsive_button.dart';
import 'package:munch/widgets/texts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottenStars = 3;
  int selectedIndex = -1; //None is selected
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        // margin: EdgeInsets.symmetric(horizontal: 16, vertical: 40),
        height: double.maxFinite,
        width: double.maxFinite,
        child: Stack(
          children: [
            Container(
              height: size.height * 0.45,
              width: double.maxFinite,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('img/welcome_3.JPG'), fit: BoxFit.cover),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 40),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        context.read<AppCubit>().setMainPage();
                      },
                      icon: const Icon(Icons.arrow_left),
                      color: Colors.black)
                ],
              ),
            ),
            Positioned(
              top: size.height * 0.38,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                //height:  ,
                width: size.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            SizedBox(width: 0),
                            LargeText(
                              text: 'Pasta',
                              color: Colors.black,
                            ),
                          ],
                        ),
                        const LargeText(
                          text: '\$250',
                          color: MyColors.textColor1,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const SizedBox(width: 2),
                        const Icon(
                          Icons.location_on,
                          color: MyColors.textColor2,
                          size: 16,
                        ),
                        const SizedBox(width: 2),
                        H2Text(text: "US, Alabama", size: 14),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const SizedBox(width: 0),
                        Wrap(
                          children: [
                            ...List.generate(
                                5,
                                (index) => Icon(
                                      gottenStars > index
                                          ? Icons.star
                                          : Icons.star_border,
                                      color: gottenStars > index
                                          ? MyColors.starColor
                                          : Colors.grey[300],
                                      size: 20,
                                    )),
                          ],
                        ),
                        const SizedBox(width: 4),
                        H2Text(
                          text: '(4.0)',
                          size: 14,
                          color: MyColors.BG500,
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    const LargeText(
                      text: 'Select Number of meals',
                      size: 18,
                    ),
                    const SizedBox(height: 16),
                    Wrap(
                        children: List.generate(
                            5,
                            (index) => InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedIndex = index;
                                    });
                                  },
                                  child: MyButton(
                                      text: (index + 1).toString(),
                                      isIcon: false,
                                      color: selectedIndex == index
                                          ? Colors.white
                                          : Colors.black,
                                      backgroundColor: selectedIndex == index
                                          ? MyColors.primary
                                          : Colors.grey[300]!,
                                      borderColor: selectedIndex == index
                                          ? MyColors.primary
                                          : Colors.grey[300]!,
                                      size: 50),
                                ))),
                    SizedBox(height: 24),
                    const LargeText(
                      text: 'Description',
                      color: Colors.black,
                      size: 20,
                    ),
                    SizedBox(height: 8),
                    H2Text(
                        text:
                            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.'),
                  ],
                ),
              ),
            ),
            Positioned(
                right: 16,
                left: 16,
                bottom: 8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyButton(
                        isIcon: true,
                        icon: Icons.favorite_border,
                        color: Colors.black,
                        backgroundColor: Colors.white,
                        borderColor: Colors.black54,
                        size: 48),
                    const SizedBox(width: 16),
                    ResponsiveButton(
                      onTap: () {},
                      isResponsive: true,
                      width: size.width * 0.9,
                      //without overflow takes as much space as possible
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
