# Model View Controller (MVC)

## Overview

The `Model-View-Controller (MVC)` is a software design pattern that separates an application into three main components: the `model`, the `view`, and the `controller`.

- `Model`: This component represents the data and the business logic of the application. It's responsible for maintaining the state of the application, and provides a way to update the view whenever the data changes.

- `View`: The view component is responsible for presenting the data to the user. It defines how the data should be displayed to the user.

- `Controller`: The controller component acts as an intermediary between the model and the view. It receives user input from the view and updates the model, or it updates the view based on changes in the model.

The main benefit of the MVC pattern is that it provides a clear separation of concerns, which makes it easier to maintain and extend the codebase. It also enables multiple views to be associated with a single model, allowing for multiple representations of the same data.

## MVC vs MVVM

`MVVM` is a design pattern that is similar to the `Model-View-Controller (MVC)` pattern, but with some key differences.

In `MVVM`, the `ViewModel` acts as the intermediary between the Model and the View. It exposes data from the Model to the View, and provides a way to update the Model based on user interactions with the View. The ViewModel also contains the logic that manipulates the data in the Model, but it doesn't have direct access to the View.

The main `advantage` of `MVVM` over `MVC` is that it allows for a better `separation of concerns`. The `ViewModel contains all the logic that is related to the presentation of data`, which makes it easier to write unit tests for this logic. Additionally, the ViewModel can be reused across multiple Views, which makes it easier to implement multiple representations of the same data.

MVVM is commonly used in conjunction with `data binding`, which `allows data to be automatically synchronized` between the `ViewModel` and the `View`. This makes it easier to create dynamic user interfaces that update automatically when the data changes.