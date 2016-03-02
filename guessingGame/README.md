# Day 2

App: guessingGame chooses a random number between 0 and 5 and has a user enter their guess. If they match, show a "Good job!", a like image and automatically make a new computer guess. If they don't, show "Nope it's not 3. Try again.", clear out the text field and dislike image.

![image](https://github.com/anitay20/ios-tutorials/guessingGame/guessingGame.gif "guessingGame")



What I learned:
* Generate random int between 0 and 6 - ```Int(arc4random_uniform(6))```
* Adding images from Assets.xcassets - ```elementName.image = UIImage(named: "name.png")```
* If you run into an ```libc++abi.dylib: terminating with uncaught exception of type NSException``` when running your app, it could be because you've wired up a button to an IBAction that doesn't exist anymore (or has been renamed). If you're running into this problem make sure that you go to Main.storyboard, RIGHT click on the yellow box icon (view controller) at the top of the phone outline and DELETE the outlet(s) with yellow flags.
* Dismiss the keyboard if you tap outside of the keyboard:
```swift
override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    self.playerGuess.delegate = self
    
    let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
    view.addGestureRecognizer(tap)
}

func dismissKeyboard() {
    view.endEditing(true)
    }
```