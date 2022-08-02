# Starlight NetChecker Widget

Starlight NetChecker Widget is a typically widget that will check your internet connection.

## Features
| Name |  Status |
|------|------|
| Animated Internet Connection Checker Widget | ✅ |
| Connectivity Plus | ✅ |


## ScreenShots
<a href="#ScreenShotsAndroid">
  <img src="https://user-images.githubusercontent.com/26484667/182286837-4c53069f-deb9-4794-afc1-b319bec3556e.png" width="200px" height="400px">
</a>&nbsp;&nbsp;
<a href="#ScreenShotsAndroid">
  <img src="https://user-images.githubusercontent.com/26484667/182286868-6344e87b-1230-4996-949d-0750bfd18d92.png" width="200px" height="400px">
</a>&nbsp;&nbsp;  
<a href="#ScreenShotsAndroid">
<img src="https://user-images.githubusercontent.com/26484667/182286565-27e8d3db-f887-42e2-bde3-f821335d7153.mp4" width="200px" height="400px">
</a>&nbsp;&nbsp;  

## Installation

Add starlight_netchecker_widget as dependency to your pubspec file.

```
   starlight_netchecker_widget: 
    git:
      url: https://github.com/YeMyoAung/starlight_netchecker_widget.git
```
## Setup

No additional integration steps are required for Android and Ios.

## Usage

First of all you need to import our package.

```dart
import 'package:starlight_netchecker_widget/starlight_netchecker_widget.dart';
```

And then you can use easily.

## Properties
```dart
  ///The widget which will show in your main ui 
  final Widget child;
  
  ///Position of indicator widget
  final StarlightNetCheckerPosition position;
  
  ///Height of indicator widget
  final double indicatorHeight;
  
  ///Color of indicator
  final Color indicatorColor, errorIndicatorColor;
  
  ///label of indicator
  final String label, errorLabel;
  
  ///Duration of indicator animation
  final Duration duration;
  
  ///The widget which will show in your indicator ui
  final Widget? customIndicator;
```

## Exapmle
```dart

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StarlightNetChecker(
      position: StarlightNetCheckerPosition.bottom,
      indicatorHeight: 50,
      indicatorColor: Colors.green,
      errorIndicatorColor: Colors.red,
      label: "Connected",
      errorLabel: "No Internet Connection",
      customIndicator: const Text("hello"),
      duration: const Duration(seconds: 1),
      child: Scaffold(),
    );
  }
}

```

## Contact Us

[Starlight Studio](https://www.facebook.com/starlightstudio.of/)
	
