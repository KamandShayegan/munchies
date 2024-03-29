# <span style="color:orange">MUNCH</span> - Food Ordering Project (A starting point for a Flutter _food ordering_ application)
<img src="https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExc2h3bW52d3lvbjY4MWVzcjd2cHdwd2JocG51NGswYmFhcXJ2M2VhYSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/3oz8xH46dD1DSx3vNK/giphy.gif" alt="Munchies" width="300"/>

Demo:\
[![Munchies project demo](https://img.youtube.com/vi/d7WEqLfyZyI/0.jpg)](https://www.youtube.com/watch?v=d7WEqLfyZyI)

## Authors
- Mohammadreza Sadeghi
- Kamand Sedaghat Shayegan


## Introduction
The main purpose of this project was to learn new tools and libraries that are more commonly used in Flutter. After enough research, we realized that the tools that we had already used to write the Flutter applications for each homework were not always the best practices (especially in the case of state management). We came across libraries like **BLoC** and **Cubit**, which are state management libraries, and we decided to create an application that handles state management using these packages. Moreover, we focused on using **Material** best practices and Object-Oriented-Design principles to write robust and efficient code.

We started by creating an onboarding page which is aimed at on-boarding the user with the application that they will use. Then we created the main page, which consists of a navigation bar of 4 pages. Due to lack of time and the fact that learning to use a better and more efficient state management library (BLoC and Cubit) took a long time, we were unable to complete the application; however, we will keep the rest of the application that is stayed unimplemented, as a concept of future work. Moreover, it is worth mentioning that through creating this application MVP, we learned many things regarding mobile development and UI design.

## Contribution
This project would not have gotten to this point without the contribution of both of us (Kamand and Mohammad). We both came to the university every day (even on weekends) for 6 days to work on the code. Fortunately, we both live close to the university, and working on the project together at the university was easy. Our contribution includes long hours of taking turns to do pair programming, once on Mohammad's laptop and once on Kamand's computer. 

## Main Focus
There were two main purposes for creating MUNCH: 
1) **To learn a more efficient way to implement state management:** We realized that an application includes more than just a couple of pages, and if more pages are added, managing state with **setState()** can become cumbersome and lead to code that is difficult to maintain. In contrast, using BLoC can help us have a more scalable application. We will dive deeper into the details of the application and how we used it.
2) **To challenge ourselves with new widgets and components of Flutter:** Creating an application using a variety of widgets and components, learning how to use them, and successfully implementing them was definitely a challenge that we accepted to help us enhance our knowledge of Flutter. Moreover, it helped us discover creative solutions for UI/UX challenges and helped us improve the quality of our application.


## BLoC and Cubit
It should be mentioned that Cubit is now part of the BLoC library, and so we will only mention BLoC from now on. It is worth mentioning that we care about Human-Computer Interaction (HCI) principles and have decided to focus on obeying HCI principles in the application, and BLoC helps us to achieve this goal.  There are several benefits that BLoC brings to us in comparison to setState(), and we will briefly mention them here:
1) **Separation of Concerns**: This aspect emphasizes that by using BLoC, we will separate the business logic from the code that is implemented for the user interface of the application.
2) **Reusability** Creating modular logic helps make code easier to understand and maintain by allowing us to reuse it in different parts of the application. This not only improves how the app functions but also makes it easier for others to work on the project, as they can easily comprehend and modify the code.
3) **Performance Optimization:** By minimizing unnecessary UI updates through writing efficient state management modules (such as updating components only when the underlying data changes) the application's performance is optimized, which would result in a more responsive user interface of Munch.

## Challenges
Developing Munch, our food ordering application, had several challenges that we had to overcome. First, as already mentioned, learning BLoC, which is a method for managing app state, took a significant amount of time because it has complexities. However, once we mastered it, developing other parts of the application became much easier. Additionally, we faced challenges in understanding and implementing various new widgets. Learning how to use these widgets without issues was a considerable challenge for us. Furthermore, we had several bugs from time to time, which required hours of debugging to resolve. However, despite these challenges, persevering through them allowed us to create a more robust and functional application.

#### *note:
It is advisable to review the code as well as the submitted video for a comprehensive understanding of our app, Munch. We say this because the app may appear to have limited features, but we devoted significant effort to writing a scalable, readable, and reusable codebase. It is worth mentioning that we also made efforts to adhere to Object-Oriented Principles (OOP) like Encapsulation, Inheritance, Polymorphism, and Abstraction.  To achieve this level of code quality (which is not perfect of course, but we tried our best) demanded research and reading various documentation sources so that we make sure that we followed best practices.

## Code
The two first options below were the most challenging parts of the development process.
### 1) State management:
#### Main Page and Initializing Bloc provider
_munch/lib/main.dart_
```

home: BlocProvider(
        create: (_) => AppCubit(),
        child: const AppCubitLogics(),
      )
```
In the home part of the MaterialApp, we have to initialize BLoC to be able to use BLoC. We will get into _AppCubitLogics()_ soon.

#### AppCubit, as the primary state management tool for traversing through pages
_munch/lib/cubit/app_cubits.dart_

```
class AppCubit extends Cubit<CubitState> {
  AppCubit() : super(InitialState()) {
    emit(WelcomeState());
  }

  setMainPage() => emit(MainPageState());
  setDetailPage() => emit(DetailPageState());
}
```

Here, AppCubit extends Cubit, which follows the inheritance principle. We do this because we want to extend the functionality of the Cubit class in our AppCubit. This class initializes the state with _InitialState()_ and immediately emits a _WelcomeState()_ (Which is the first page that the user sees when they open Munch). Additionally, it provides methods _setMainPage()_ and _setDetailPage()_ to change the state to _MainPageState()_ and _DetailPageState()_, respectively. Essentially, it manages the state transitions within the application. What are these states?

#### Each state in Cubit
_munch/lib/cubit/app_cubit_states.dart_
```
class InitialState extends CubitState {
  @override
  List<Object> get props => [];
}

class WelcomeState extends CubitState {
  @override
  List<Object> get props => [];
}
...
```
Here, we had to define each state as a CubitState object because the _emit()_ function that was mentioned above, receives _CubitState_ objects.

#### Which widget rebuilds the user interface?
_munch/lib/cubit/app_cubit_logics.dart_
```
Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubit, CubitState>(
        builder: (context, state) {
          if (state is WelcomeState) {
            return const WelcomePage();
          } else if (state is MainPageState) {
            return const MainPage();
          } else if (state is DetailPageState) {
            return const DetailPage();
          } else {
            return Container();
          }
        },
      ),
    );
  }
```
_BlocBuilder_ is a widget provided by the BLoC library that helps rebuild UI components in response to changes in the state of a BLoC! This means that whenever the state changes, BlocBuilder is triggered to rebuild this page.

#### How to trigger state?
_munch/lib/pages/welcome_page.dart_
```
      floatingActionButton: ResponsiveButton(
        onTap: () {
          context.read<AppCubit>().setMainPage();
        },
      ),
```
Wherever there is access to _context_, the state can be changed. Just like here in this _ResponsiveButton()_, the user is in the _WelcomePage()_ and when it clicks on _ResponsiveButton()_ it is taken to the _MainPage()_.

### 2) TabBar:
One of the very interesting **Material** widgets that we came across and considered to use in our application was _TabBar()_.
_munch/lib/pages/navbar_pages/home_page.dart_
```
TabController _tabController = TabController(length: 4, vsync: this);

```
We define a _TabController()_ and give it the number of tabs that we will have.
```
           child: TabBar(
                labelColor: Colors.black,
                labelPadding: const EdgeInsets.only(left: 16, right: 16),
                indicatorSize: TabBarIndicatorSize.label,
                indicator: DotIndicator(color: MyColors.primary, radius: 3),
                unselectedLabelColor: Colors.grey,
                isScrollable: true,
                controller: _tabController,
                tabs: const [
                  Tab(text: "FastFood"),
                  Tab(text: "Thai"),
                  Tab(text: "Sushi"),
                  Tab(text: "Indian"),
                ],
              ),
            ),
```
Then, we determine what are the values of each tab, and customize the tab bar as we want to.
```
child: TabBarView(
                controller: _tabController,
                children: [
                  ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) => InkWell(
                      onTap: () {
                        context.read<AppCubit>().setDetailPage();
                      },
                      child: Container(
                        margin: const EdgeInsets.only(left: 8, top: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.red,
                          image: const DecorationImage(
                              image: AssetImage('img/welcome_1.JPG'),
                              fit: BoxFit.cover),
                        ),
                        height: double.maxFinite,
                        width: 180,
                      ),
                    ),
                  ),
                  const Center(child: Text('Thai Food')),
                  const Center(child: Text('Sushi')),
                  const Center(child: Text('Indian')),
                ],
              ),
```
At this point, we make sure that when the user clicks on each item, the state changes, and the user is sent to the _DetailPage()_. This page is static for now and the focus was mostly on the design, and making the page user-friendly. To design this page, we looked at similar examples.
### 3) Colors
_munch/lib/utils/my_colors.dart_
```
class MyColors {
  static const Color textColor2 = Color(0xffffcc99);
  static const Color textColor1 = Color(0xffff9966);
  static const Color bigTextColor = Color(0xff2e2e31);
  static const Color primary = Color(0xffff642f);
  static const Color secondary = Color(0xffF89344);
  static const Color BG700 = Color(0xff393A3A);
  static const Color BG500 = Color(0xff575959);
  static const Color BG300 = Color(0xffF4F4F4);
  static const Color starColor = Color(0xffffd27d);
  // static final Color starColor = Color();
}
```
For usability purposes, we decided to create a _MyColors{}_ class and put the most commonly used colors there and name them in a meaningful way so that we know when we want to use them.
### 4) MyButton
_munch/lib/widgets/buttons.dart_
```
class MyButton extends StatelessWidget {
  String? text;
  IconData? icon;
  final bool isIcon;
  final Color color;
  final Color backgroundColor;
  final Color borderColor;
  final double size;

  MyButton(
      {Key? key,
      this.icon,
      this.text = 'null',
      required this.isIcon,
      required this.color,
      required this.backgroundColor,
      required this.borderColor,
      required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 8),
      width: size,
      height: size,
      decoration: BoxDecoration(
      ...
```
Lastly, again, for usability purposes, we decided to create a reusable button and call it _MyButton()_. This button will show _null_ if there are no texts given to it as the text at the center of the button.

## Last words
Of course, there are many other parts of the application to explain, but we decided to keep it short and mention the new and challenging parts of the code. Lastly, it is worth mentioning that the focus of this application was to use best practices, design a user-friendly UI, and write efficient and reusable code. Please do not hesitate to contact us (ksedagha23@student.oulu.fi, mohammadreza.sadeghi@student.oulu.fi) in case there is any ambiguity.  


## References
[https://api.flutter.dev/flutter/material/TabBar-class.html](https://api.flutter.dev/flutter/material/TabBar-class.html)

[https://docs.flutter.dev/cookbook/design/tabs](https://docs.flutter.dev/cookbook/design/tabs)

[https://pub.dev/packages/flutter_bloc](https://pub.dev/packages/flutter_bloc)

[https://bloclibrary.dev](https://bloclibrary.dev)

[https://medium.com/codex/flutter-bloc-an-introduction-with-cubit-7eae1e740fd0](https://medium.com/codex/flutter-bloc-an-introduction-with-cubit-7eae1e740fd0)

[https://burakakten.medium.com/flutter-bloc-cubit-5ee4d053f61d](https://burakakten.medium.com/flutter-bloc-cubit-5ee4d053f61d)

[https://medium.com/@shivabande09/flutter-state-management-bloc-vs-setstate-a-comparative-analysis-1334885ae8cd](https://medium.com/@shivabande09/flutter-state-management-bloc-vs-setstate-a-comparative-analysis-1334885ae8cd)

[]()
