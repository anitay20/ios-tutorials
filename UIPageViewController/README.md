UIPageViewController

Here's the tutorial that I followed:
https://spin.atomicobject.com/2015/12/23/swift-uipageviewcontroller-tutorial/

So the first time I finished the tutorial, I noticed that page wasn't being swiped to the next page. After debugging this, I realized that the current view controller wasn't matching up with any of the view controllers in the array. My array of View Controllers were being created every time I swiped, so that's why it wouldn't match up and kept returning nil. 

After asking a coworker for help, he was able to validate my conclusion and help me fix it. The fix was easy: initialize the array of view controllers and don't create it again and again in the datasource.
