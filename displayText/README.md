# Day 1

App: displayText displays the text that the user types in and the reset button returns the text to the original state. An added feature was to make the return key act like a button.

![image](https://github.com/anitay20/ios-tutorials/displayText/displayText.gif "displayText")



What I learned:
* Adding Objects into the main storyboard: Label, text field, buttons
* Interacting and updating elements on the page
* Reset text, labels, everything on the page with a button.

__To make the return key act as the button being tapped:__
Add ```UITextFieldDelegate``` and this in the ```ViewController``` file:

```swift
override func viewDidLoad() {
        super.viewDidLoad()
        self.textField.delegate = self
    }

 func textFieldShouldReturn(textField: UITextField!) -> Bool {
    //textField code

        textField.resignFirstResponder()  //if desired
        performAction()
        return true
    }

 func performAction() {
 //action events

 }
```

__Questions:__ 

**Is there any way to simulate tapping the submit button in performAction()?**
Add the actions you want to perform in the performAction() function and in the button function, just call performAction().
