# Flutter

This is a respository for learning flutter from scratch
## contents

- [Flutter](#flutter)
  - [contents](#contents)
  - [author](#author)
  - [changeLog](#changelog)
  - [introduction](#introduction)
  - [samples](#samples)
  - [getting started](#getting-started)
    - [hello world](#hello-world)
  - [next steps](#next-steps)
  - [scaffolding an app](#scaffolding-an-app)
  - [syntax](#syntax)
  - [libraries](#libraries)
  - [commands](#commands)
  - [regions](#regions)
  - [buttons](#buttons)
  - [navigation](#navigation)
    - [navigation notes](#navigation-notes)
    - [navigation projects](#navigation-projects)
  - [visibility](#visibility)
  - [containers](#containers)
  - [components](#components)
  - [state](#state)
  - [lifecycle methods](#lifecycle-methods)
  - [styling](#styling)
  - [gestures](#gestures)
  - [painting shapes](#painting-shapes)
  - [documentation](#documentation)
  - [oop](#oop)
  - [unit tests](#unit-tests)
  - [api](#api)
  - [android studio](#android-studio)
  - [ongoing maintenance of sdk and package versions](#ongoing-maintenance-of-sdk-and-package-versions)
  - [sqlite](#sqlite)
  - [all projects](#all-projects)
  - [architecture](#architecture)
  - [performance](#performance)
  - [geolocation](#geolocation)
  - [firebase](#firebase)
  - [debugging your app](#debugging-your-app)
  - [publishing your app](#publishing-your-app)


## author

Philip Anderson 
github@philanderson.co.uk

## changeLog

- May 2020 - Initial Build
- August 2021 - Refactor Notes
- November 2021 - adding much more detail - components, unit tests, api, styling, list view, text input fields, text labels, buttons, alert dialog boxes, and more
- - April 2022 - adding an ongoing 'live' project where latest features are added to this live project demo which holds examples of many teaching features at once, all inside the one app.  Currently using the Course05BusinessCard2 app but hopefully will rename this at a future date; at the moment just running with this name.

## introduction

This is an introduction to the flutter language and ecosystem, and reasons to use flutter, and comparisons with similar technologies

[introduction](notes/introduction.md)

## samples

a few examples of sample demos and code can be found [here](notes/components.md#samples) 

## getting started

Instructions on how to get started with flutter

- [getting started notes](notes/getting-started.md)

### hello world 

- hello world projects

## next steps

[Next Steps](notes/next-steps.md)

## scaffolding an app

[building an app with automatic scaffolding](notes/scaffolding.md)

## syntax

an introduction to flutter syntax

[syntax](notes/syntax.md)

## libraries

[libraries](notes/libraries.md)

## commands

here is a list of basic flutter commands to help you get started with working with flutter

[commands](notes/commands.md)

## regions

regions are very useful for tidying up code

[regions](notes/regions.md)

## buttons

after you have learned the super basics in hello world, next step will be to have a few buttons clicked.  please see the button_nn sequence of projects and work your way through them

## navigation

Navigation uses tabs and drawers.

Route - tells us where to go from now

Stack - keeps track of navigation so far and how to go back

### [navigation notes](notes/navigation.md)

### navigation projects

  - [navigation_01_two_pages](projects/navigation_01_two_pages)
  - [MultiPage01](Projects/MultiPage01)
  - [MultiPage02](Projects/MultiPage02)
  - [MultiPage03](Projects/MultiPage03)
  - [MultiPage04](Projects/MultiPage04) for a demonstration of code which navigates 4 pages and back.
  - [MultiPage05](Projects/MultiPage05) This project clicks through to `Page5` where an item may be clicked on.  After a 2-second delay the user is taken either to `Page6` or `Page7` depending on which index is clicked.  Clicking on items index 0 or 1 takes to `Page6` which is `stateless` and clicking on any other index takes to `Page7` which is `stateful`


## visibility

we can easily show and hide components

[visibility](notes/components.md#visibility)

## containers

containers allow us to lay out our components properly using rows, columns and grids on the screen

[containers](notes/containers.md)

## components 

Next we progress into building and using components

- [components](notes/components.md)
- [containers](notes/containers.md)

- components projects

  - [Simple Button Click](projects/ButtonClick01)
  - [Simple List View](projects/ListView01)
  - [Display Rows And Columns](projects/RowsAndColumns01)
  - [Display ListView Component](projects/ListView01)
  - [Display MultiPage Setup](projects/MultiPage01)

## state

- [state](notes/state.md)

## lifecycle methods

- [lifecycle](notes/lifecycle.md)

## styling

- [styling](notes/styling.md)
  - [constraints (max/min width)](notes/styling.md#constraints)
## gestures

[gestures](notes/gestures.md)

## painting shapes

[painting](notes/painiting.md)

## documentation

[documentation](notes/documentation.md)

## oop

- [oop](notes/oop.md)

## unit tests

How to run unit tests

- [unit testing notes](notes/unit-testing.md)
- [unit test projects](projects/UnitTest01)

## api

Next we progress into reading data from an api into our app, and displaying it

- [api notes - reading and displaying api data](notes/api.md)
- [async](notes/async.md)

- api projects
  
  - [Obtain API data](projects/APIGet01)
  - [APIGet04](projects/APIGet04) - display 100 cards with API data and toggle list colour from blue to yellow
  - [APIGet05](projects/APIGet05) - toggle individual cards and print individual data
  - [APICRUD02](APICRUD02)
    - This is a clone of [MultiPage05](MultiPage05) and shows the full CRUD operations on a given list of items drawn from an API
  - [WordPair01](projects/WordPair01)
    - sample app to display word pairs from an API


## android studio

[getting started with android studio](notes/getting-started-with-android-studio.md)

## ongoing maintenance of sdk and package versions

[ongoing maintenance](notes/maintaining-flutter.md)

## sqlite

[sqlite](notes/sqlite.md)
## all projects

A list of all projects is below

- [all projects](projects/README.md)


## architecture

[architecture](notes/architecture.md)

## performance

[performance](notes/performance.md)

## geolocation

[geolocation](notes/geolocation.md)

## firebase

[firebase](notes/firebase.md)


## debugging your app

[debugging](notes/debugging.md)

## publishing your app

[publishing](notes/debugging.md)


