# Clean Swift

## VIP Cycle

The view controller, interactor, and presenter are the three main components of Clean Swift. They act as input and output to one another as shown in the following diagram:

![img](https://clean-swift.com/wp-content/uploads/2015/08/VIP-Cycle-1024x768.png)

## View Controller

- **output** of View Controller is **input** for the Interactor
- controls and updates the View objects it's responsible for. Receives user input and gestures
- defines VCInput and VCOutput protocols
- special properties
  - **output**
    - conforms to VCOutput protocol
      - `doSomething(request)`
    - we know in VIP cycle it should be an Interactor, but it doesn't need to be
  - **router**
    - reference to **Router** object
    - used to navigate to different scenes
- if we have business logic (need to talk to the database), we create a **Request** object and invoke `doSomething(request)` on the interactor.
  - View Controller doesn't care about who does it or how it's done

## Interactor

- **output** of the Interactor is **input** for the Presenter
- contains all of your app's business logic
  - The user taps and swipes in your UI in order to interact with your app. The View Controller collects the user inputs from the UI and passes it to the Interactor. The Interactor then retrieves some models and asks some workers to do the work.
- defines InteractorInput and InteractorOutput protocols
- special properties
  - **output**
    - conforms to the InteractorOutput protocol
      - `presentSomething(response)`
    - we know in VIP cycle it should be a Presenter, but it doesn't need to be
  - **worker**
    - a **Worker** object that the Interactor can delegate work to
    - Core Data
    - network calls
    - network response validation
    - there can be multiple workers
- receives a Request object from the View Controller, creates workers to do the work, then constructs a Response object and invokes `presentSomething(response)` on the output.

## Presenter

- **output** of the Presenter is **input** for the View Controller
- responsible for formatting the output of the Interactor into **View Models** that the View Controller will present
  - After the interactor produces some results, it passes the response to the Presenter. The Presenter then marshals the response into view models suitable for display. It then passes the view models back to the view controller for display to the user.
- defines PresenterInput and PresenterOutput protocols
- special properties
  - **output**
    - conforms to the PresenterOutput protocol
      - `displaySomething(viewModel)`
    - we know in VIP cycle it should be a View Controller, but it doesn't need to be
    - **this property is set to weak to avoid strong reference cycles**
- receives a Response object from the Interactor, formats the results into a View Model, and passes that to the View Controller

## Remark: Data Communication

Data that is passed between the View Controller, Interactor, and Presenter consists of **only primitive types**. 

We can create structs, classes, or enums to represent the data but there should only be primitive types inside these containing entities.

- primitive types in Swift are usually **value types**.
  - Int
  - Double
  - String
  - Character
  - Bool
  - Array
  - Sets
  - Dictionaries
  - **structs**
  - **enums**
  - classes?

There are three **special objects**:

- The View Controller's output is a **Request** object.
- The Interactor's output is a **Response** object.
- The Presenter's output is a **View Model** object.

These objects are defined in the **Models** file (discussed later)

## Router

- When the user taps the next button to navigate to the next scene in the storyboard, a segue is trigged and a new view controller is presented. A router extracts this navigation logic out of the view controller. 
- Best place to pass any data to the next scene. 
  - As a result, the view controller is left with just the task of controlling views.
- The router conforms to its own **RoutingLogic** protocol which specifies which View Controllers it can navigate to.
  - "If you use me as your router, I can navigate to controllers X, Y, and Z."
  - `func routeToController(segue: UIStoryboardSegue?)`
- special properties
  - **viewController**
    - a **weak** reference to the viewController that is using this router

## Models

As mentioned earlier, to completely decouple the Clean Swift components, we need to define data models to pass through the boundaries between them, instead of just using raw data models.

- **Request**
  - The view controller constructs a request model and passes it to the interactor. 
  - A request model contains mostly user inputs, such as text entered in text fields and values chosen in pickers.
- **Response**
  - After the interactor finishes doing work for a request, it encapsulates the results in a response model and then passes it to the presenter.
- **View Model**
  - After the presenter receives the response from the interactor, it formats the results into primitive data types such as String and Int, and stuffs them in the view model. 
  - It then passes the view model back to the view controller for display.