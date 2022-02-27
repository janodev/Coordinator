# ``Coordinator``

A **Coordinator** encapsulates a module of the application made of several view controllers.

Responsibilities
* Coordinators decide and perform navigation.

Benefits
* Controllers are not coupled to other controllers.
* You have controllers grouped by use case.
* Navigation flow can be refactored easily.
* Dependency injection is performed in one point instead dragging dependencies through all screens.

## Implementation

The app delegate retains a root coordinator, which may own and spawn child coordinators for particular flows. Here is a possible implementation of the coordinator:

![Coordinator](Coordinator)

### View Controller

The **view controller** owns the view, handles the interactions with the view, and coordinates responses with other objects.

It should
* Set closures in the view to react to view events.
* Send data to the view to be displayed.

It should not
* Contain navigation code.
* Be aware of other controllers.
* Access global state.
* Have logic for application, navigation, or UI.

### View
The view is the UI.

It should
* Handle the datasource, delegate, and UI logic.
* Create and manage subviews.

It should not
* Be aware of any view controller.

## Topics

### Protocols

- ``Coordinating``
- ``NavigationCoordinating``
- ``RootCoordinating``
