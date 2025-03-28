# food_app
<p align="center">
  <img src="https://img.shields.io/github/stars/SinaSys/flutter_japanese_restaurant_app">
  <img src="https://img.shields.io/github/forks/SinaSys/flutter_japanese_restaurant_app">
  <img src="https://img.shields.io/github/actions/workflow/status/SinaSys/flutter_japanese_restaurant_app/main.yml?label=CI&logo=github">
  <img src="https://img.shields.io/github/v/release/SinaSys/flutter_japanese_restaurant_app?label=Release&logo=semantic-release">
  <img src="https://img.shields.io/github/last-commit/SinaSys/flutter_japanese_restaurant_app?label=Last%20commit">

## Screenshots (Light mode)

Onboarding     

![](https://github.com/MTS-Services/Task-Management/blob/main/screenshot/Fall%20Abstract%20Video%20Mobile%20Mockup%20Linkedin%20Post%20%20(2).png?raw=true)|

## Screenshots (Light mode)

SognIn SingnUp     

![](https://github.com/MTS-Services/Task-Management/blob/main/screenshot/Fall%20Abstract%20Video%20Mobile%20Mockup%20Linkedin%20Post%20%20(1).png)|


## Screenshots (Light mode)

Dashboard     

![](https://github.com/MTS-Services/Task-Management/blob/main/screenshot/Fall%20Abstract%20Video%20Mobile%20Mockup%20Linkedin%20Post%20%20(3).png)|


## 🚀 Features :
```
• Bottom navigation animation when switch from one screen to another
• Fade animation for food items in detail screen and list views
• Delete single food item from cart by swipe item to right side
• Automatically delete single item from cart by set its value to zero
• Increase or Decrease quantity for each food item in cart screen
• Display food list on the food list screen
• Real-time calculation of total price in the cart screen
• Select quantity for each item on detail screen
• Filter foods by category
• State management with GetX 
```


## Directory Structure (GetX version)
```
📂lib
 │───main.dart  
 │───📂core  
 |   │──app_asset.dart
 |   │──app_color.dart
 |   │──app_data.dart
 |   │──app_icon.dart
 |   │──app_style.dart
 |   │──app_theme.dart
 |   └──app_extension.dart
 └───📂src
     │────📂model
     │    │──bottom_navigation_item.dart
     |    │──food.dart
     |    └──food_category.dart
     └────📂view
     |    │───📂screen
     |    |   |──cart_screen.dart
     |    |   |──favorite_screen.dart
     |    |   |──food_detail_screen.dart
     |    |   |──food_list_screen.dart
     |    |   |──home_screen.dart
     |    |   └──profile_screen.dart
     |    │───📂widget
     │    |   |──counter_button.dart
     │    |   |──custom_page_route.dart
     │    |   |──empty_widget.dart
     │    |   |──fade_animation.dart
     │    |   |──food_list_view.dart
     │    |   |──page_transition.dart
     |    |   └──scale_animation.dart
     └────📂controller
          └──food_controller.dart


