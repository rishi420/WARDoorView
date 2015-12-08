# WARDoorView

[![CI Status](http://img.shields.io/travis/Warif Akhand Rishi/WARDoorView.svg?style=flat)](https://travis-ci.org/Warif Akhand Rishi/WARDoorView)
[![Version](https://img.shields.io/cocoapods/v/WARDoorView.svg?style=flat)](http://cocoapods.org/pods/WARDoorView)
[![License](https://img.shields.io/cocoapods/l/WARDoorView.svg?style=flat)](http://cocoapods.org/pods/WARDoorView)
[![Platform](https://img.shields.io/cocoapods/p/WARDoorView.svg?style=flat)](http://cocoapods.org/pods/WARDoorView)

<p align="center"><img src="https://cloud.githubusercontent.com/assets/2233857/11636265/7b77b970-9d45-11e5-8612-146e53070088.gif"/></p>

## Features

- [x] Written in Swift
- [x] Work on both Swift and Objective-C projects
- [x] Orientation support

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

### Swift
```swift
import WARDoorView

public func doorOpen(angle: Double = default, duration: NSTimeInterval = default, delay: NSTimeInterval = default, completion: (() -> Void) = default)

public func doorClose(duration: NSTimeInterval = default, delay: NSTimeInterval = default, completion: (() -> Void) = default)

// Example
    warDoorViewObj.doorOpen(delay: 10)
//or 
    warDoorViewObj.doorOpen()
```
### Objective-C
```Objective-C
@import WARDoorView;

// Example
    [warDoorViewObj doorOpen:90 duration:2 delay:1 completion:^{
        //Door did open
    }];
    
    [warDoorViewObj doorClose:2 delay:1 completion:^{
        //Door did close
    }];
```

<p align="center"><img src="https://cloud.githubusercontent.com/assets/2233857/11636817/3b077706-9d48-11e5-9b6a-a13eec543bb9.gif"/></p>


## Requirements

- iOS 8.0+
- Xcode 7.1+


## Installation

> **Embedded frameworks require a minimum deployment target of iOS 8**

### CocoaPods
WARDoorView is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "WARDoorView"
```

### Manually
Find the **WARDoorView** folder inside **Pod/Classes**


## Author

Warif Akhand Rishi, rishi420@gmail.com

## License

WARDoorView is available under the MIT license. See the LICENSE file for more info.
