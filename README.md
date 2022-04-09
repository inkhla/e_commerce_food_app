# Concept E-Commerce Food Application

A Food app project created in flutter using Get, Food app supports both web and mobile with a responsive ui on any device.

## Getting Started
The Food app contains the minimal implementation required to create a new library or project.
The repository code is preloaded with some basic components like basic app architecture, app theme,
constants and required dependencies to create a new project. By using Food app code as standard initializer,
we can have same patterns in all the projects that will inherit it. This will also help in reducing setup & development time by
allowing you to use same code pattern and avoid re-writing from scratch.

## How to Use

**Step 1:**
Download or clone this repo by using the link below:  
```
https://github.com/inkhla/e_commerce_food_app
```

**Step 2:**
Go to project root and execute the following command in console to get the required dependencies:  
```
flutter pub get 
```

**Step 3:**

This project uses `inject` library that works with code generation, execute the following command to generate files:

```
flutter packages pub run build_runner build --delete-conflicting-outputs
```

or watch command in order to keep the source code synced automatically:

```
flutter packages pub run build_runner watch
```

## Travel App Features:
- Transition
- Navigation
- Responsive  
- Home
- Routing
- Get
- Rest Api

### Up-Coming Features:
- Login
- User Notifications
- Theme
    - Dark Theme Support
- MobX
- Navigation Bar
- User Page
- Settings

### Libraries & Tools Used:
* [Get](https://pub.dev/packages/get)
* [Conditional Builder Null Safety](https://pub.dev/packages/conditional_builder_null_safety)
* [Dots indicator](https://pub.dev/packages/dots_indicator)

### Folder Structure
Here is the core folder structure which flutter provides.

```
flutter-app/
|- android
|- build
|- ios
|- lib
|- test
```
Here is the folder structure we have been using in this project

```
lib/
|- data/
|- helper/
|- models/
|- routes/
|- screens/
|- utils/
|- widgets/
|- main.dart
```
Now, lets dive into the lib folder which has the main code for the application.

```
1- data - Contains the data layer of your project, includes directories network and store(s) for state-management of your application, to connect the reactive data of your application with the UI.
2- helper - Contains the dependenices of the data file.
3- models - Contains the models of the data requested from API.
4- routes - This file contains all the routes for your application.
5- screens - Contains all screens projected in the app.
6- utils - Contains the utilities/common functions of your application.
7- widgets - Contains the common widgets for your applications. For example, Button, Text etc.
8- main.dart - This is the starting point of the application. All the application level configurations are defined in this file i.e, theme, routes, title, orientation etc.
```
### Data

All the business logic of your application will go into this directory, it represents the data layer of your application. It is sub-divided into three directories `api`, `controllers` and `repository`, each containing the domain specific logic. Since each layer exists independently, that makes it easier to unit test.

```
data/
|- api/
    |- api_client.dart
   
|- controllers/
    |- cart_controller.dart
    |- popular_product_controller.dart
    |- recommended_product_controller.dart
    
|- repository
    |- cart_repo.dart
    |- popular_product_repo.dart
    |- recommended_product_repo.dart

```

### Helper

Controls the dependencies of states of the app(requesting data).

```
helper/
|- dependencies.dart
```

### Models

Contains the models of the data requested from API.

```
models/
|- cart_model.dart
|- popular_product_model.dart
```

### Routes

This file contains all the routes for your application.

```
routes/
|- route_helper.dart
```
content : 
```dart
import 'package:e_commerce_food_app/screens/food/popular_food_detail.dart';
import 'package:e_commerce_food_app/screens/food/recommended_food_detail.dart';
import 'package:e_commerce_food_app/screens/home/main_food_page.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String initial = '/';
  static const String popularFood = '/popular-food';
  static const String recommendedFood = '/recommended-food';

  static String getInitial() {
    return initial;
  }
  static String getPopularFood(int pageId)
    =>  '$popularFood?pageId= $pageId';

  static String getRecommended(int pageId) {
    return '$recommendedFood?pageId=$pageId';
  }

  static List<GetPage> routes = [
    GetPage(
      name: initial,
      page: () => const MainFoodPage(),
    ),
    GetPage(
      name: popularFood,
      page: () {
        var pageId = Get.parameters['pageId'];
        print('popular food get called');
        return PopularFoodDetail(pageId: int.parse(pageId!),);
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: recommendedFood,
      page: () {
        var pageId = Get.parameters['pageId'];
        print('recommended food get called');
        return RecommendedFoodDetail(pageId: int.parse(pageId!),);
      },
      transition: Transition.fadeIn,
    )
  ];
}

```

### Screens

Contains all screens projected in the app.

```
screens/
|- food/
    |- popular_product_detail.dart
    |- recommended_food_detail.dart

|- home\
    |- food_page_body.dart
    |- main_food_page.dart
```

### Utils

Contains the common file(s) and utilities used in a project. The folder structure is as follows:

```
utils/
|- app_constants.dart
|- colors.dart
|- dimensions.dart

```

### Widgets

Contains the common widgets for your applications. For example, Button, Text etc.

```
widgets/
|- app_bar_icon.dart
|- big_text.dart
|- expandable_text.dart
|- icon_text_widget.dart
|- meal_desc.dart
|- small_text.dart
```

### Main

This is the starting point of the application. All the application level configurations are defined in this file i.e, theme, routes, title, orientation etc.

```dart

import 'package:e_commerce_food_app/data/controllers/popular_product_controller.dart';
import 'package:e_commerce_food_app/data/controllers/recommended_food_controller.dart';
import 'package:e_commerce_food_app/routes/route_helper.dart';
import 'package:e_commerce_food_app/screens/home/main_food_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'helper/dependencies.dart' as dep;


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();
    return  GetMaterialApp(
      title: 'E-Commerce',
      debugShowCheckedModeBanner: false,
      home: const MainFoodPage(),
      initialRoute:  RouteHelper.initial,
      getPages: RouteHelper.routes,
    );
  }
}


```



## Conclusion:
I will be happy to answer any questions that you may have
on this approach, and if you want to lend a hand with the
Food pull request 🙂.

Again to note, this is example can appear as over-architectured
for what it is - but it is an example only. If you liked my work,
don’t forget to ⭐ star the repo to show your support.
