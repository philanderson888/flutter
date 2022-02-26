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
  - [navigation](#navigation)
  - [visibility](#visibility)
  - [containers](#containers)
  - [components](#components)
  - [state](#state)
  - [styling](#styling)
  - [gestures](#gestures)
  - [painting shapes](#painting-shapes)
  - [documentation](#documentation)
  - [oop](#oop)
  - [unit tests](#unit-tests)
  - [api](#api)
  - [android studio](#android-studio)
  - [sqlite](#sqlite)
  - [all projects](#all-projects)
  - [performance](#performance)


## author

Philip Anderson 
github@philanderson.co.uk

## changeLog

- May 2020 - Initial Build
- August 2021 - Refactor Notes
- November 2021 - adding much more detail - components, unit tests, api, styling, list view, text input fields, text labels, buttons, alert dialog boxes, and more

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

  - [Hello World 01](projects/HelloWorld01)
  - [Hello World 02](projects/HelloWorld02)
  - [Hello World 03](projects/HelloWorld03)
  - [Hello World 04](projects/HelloWorld04)
  - [Hello World 05](projects/HelloWorld05)


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

## navigation

Navigation uses tabs and drawers.

Route - tells us where to go from now

Stack - keeps track of navigation so far and how to go back

- [navigation notes](notes/navigation.md)
- navigation projects
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

## sqlite

[sqlite](notes/sqlite.md)
## all projects

A list of all projects is below

- [all projects](projects/README.md)

## performance

[performance](notes/performance.md)
