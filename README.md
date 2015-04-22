Glue
====

[![Twitter: @KauseFx](https://img.shields.io/badge/contact-@nubbel-blue.svg?style=flat)](https://twitter.com/nubbel)
[![License](http://img.shields.io/badge/license-MIT-green.svg?style=flat)](https://github.com/nubbel/Glue/blob/master/LICENSE)
[![Release](http://img.shields.io/github/release/nubbel/Glue.svg?style=flat)](https://github.com/nubbel/Glue/releases/latest)
[![CocoaPods](https://img.shields.io/cocoapods/v/Glue.svg?style=flat)](http://cocoadocs.org/docsets/Glue)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)


Seamlessly glue multiple storyboards together without writing a single line of code.

<p align="center">
  <a href="http://youtu.be/lQzjHntOKZg"><img src="http://share.gifyoutube.com/Kz77qb.gif" alt="Glue Demo"/></a>
</p>

Facts:
- 3 Storyboards
- 16 View controllers (tab bar controller, container view controllers, etc.)
- 0 lines of code

## Features

- [x] Works with `UITabBarController` (replaces the tab).
- [x] Works with container view controllers and any other kinds of view controllers.
- [x] No code required!

## Requirements

- iOS 8.1+
- Xcode 6.1

## Installation

## Installation

### Using a dependency manager

#### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects.

CocoaPods 0.36 adds supports for Swift and embedded frameworks. You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate Glue into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.1'
use_frameworks!

pod 'Glue', '~> 0.0.3'
```

Then, run the following command:

```bash
$ pod install
```

#### Carthage

Carthage is a decentralized dependency manager that automates the process of adding frameworks to your Cocoa application.

You can install Carthage with [Homebrew](http://brew.sh/) using the following command:

```bash
$ brew update
$ brew install carthage
```

To integrate Glue into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "nubbel/Glue" ~> 0.0.3
```

### Manually

If you prefer not to use either of the aforementioned dependency managers, you can integrate Glue into your project manually.

#### Embedded Framework

1. Add Glue as a [submodule](http://git-scm.com/docs/git-submodule) by opening the Terminal, `cd`-ing into your top-level project directory, and entering the command `git submodule add https://github.com/nubbel/Glue.git`
2. Open the `Glue` folder, and drag `Glue.xcodeproj` into the file navigator of your app project.
3. In Xcode, navigate to the target configuration window by clicking on the blue project icon, and selecting the application target under the "Targets" heading in the sidebar.
4. Ensure that the deployment target of Glue.framework matches that of the application target.
5. In the tab bar at the top of that window, open the "Build Phases" panel.
6. Expand the "Target Dependencies" group, and add `Glue.framework`.
7. Expand the "Link Binary with Libraries" group, and add `Glue.framework`.
8. Click on the `+` button at the top left of the panel and select "New Copy Files Phase". Rename this new phase to "Copy Frameworks", set the "Destination" to "Frameworks", and add `Glue.framework`.


#### Source File

Copy the `GlueViewController.swift` file to your project, it doesn't have any dependencies.

---


## Usage

Suppose you have two storyboards `A` and `B`. In order to glue them together, follow these steps:

1. In storyboard `A` place a view controller where you want a view controller from `B` to appear.
2. Select the view controller and go to the _Identity Inspector_. Set "Custom Class" to `GlueViewController`, the "Module" should then automatically be set to `Glue`.
3. In the _Attributes Inspector_ you'll then find a new section labelled with "Glue View Controller". Set "Storyboard Name" to `B` and you're done!


### Options

The options can be set on the `GlueViewController` instance either in the _Attributes Inspector_ under "Glue View Controller" (courtesy of `IBDesignable` & `@IBInspectable`) or in the _Identity Inspector_ as "User Defined Runtime Attributes". Finally, you could also subclass `GlueViewController` and override the properties there, but who wants to write code?

**Storyboard Name** (`storyboardName`): The name of the storyboard you want to link this `GlueViewController` instance to. If empty the current storyboard will be used.

**View Controller Identifier** (`viewControllerIdentifier`): The "Storyboard ID" as defined in the _Identity Inspector_ of the view controller you want to link this `GlueViewController` instance to. If empty the initial view controller of the specified storyboard will be used.


## Example

You can find an example project in the Example directory.
Here's a short demo video: http://youtu.be/lQzjHntOKZg

---

# License
This project is licensed under the terms of the MIT license. See the [LICENSE](https://github.com/nubbel/Glue/blob/master/LICENSE) file.

# Contributing

1. Create an issue to discuss about your idea
2. Fork it (https://github.com/nubbel/Glue/fork)
3. Create your feature branch (`git checkout -b my-new-feature`)
4. Commit your changes (`git commit -am 'Add some feature'`)
5. Push to the branch (`git push origin my-new-feature`)
6. Create a new Pull Request
