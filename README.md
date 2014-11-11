Glue
====

[![Twitter: @KauseFx](https://img.shields.io/badge/contact-@nubbel-blue.svg?style=flat)](https://twitter.com/nubbel)
[![License](http://img.shields.io/badge/license-MIT-green.svg?style=flat)](https://github.com/nubbel/Glue/blob/master/LICENSE)


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

_Due to the current lack of [proper infrastructure](http://cocoapods.org) for Swift dependency management, using Glue in your project requires the following steps:_

1. Add Glue as a [submodule](http://git-scm.com/docs/git-submodule) by opening the Terminal, `cd`-ing into your top-level project directory, and entering the command `git submodule add https://github.com/nubbel/Glue.git`
2. Open the `Glue` folder, and drag `Glue.xcodeproj` into the file navigator of your app project.
3. In Xcode, navigate to the target configuration window by clicking on the blue project icon, and selecting the application target under the "Targets" heading in the sidebar.
4. Ensure that the deployment target of Glue.framework matches that of the application target.
5. In the tab bar at the top of that window, open the "Build Phases" panel.
6. Expand the "Target Dependencies" group, and add `Glue.framework`.
7. Click on the `+` button at the top left of the panel and select "New Copy Files Phase". Rename this new phase to "Copy Frameworks", set the "Destination" to "Frameworks", and add `Glue.framework`.

_Alternatively_ you could also just copy the `GlueViewController.swift` file to your project, it doesn't have any dependencies.

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
