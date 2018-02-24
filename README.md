# SlidingMenu
## A simple sliding menu that can be used on any controller

### Usage:-

First copy the viewcontroller in the storyboard to your desired storyboard and set its file to SlidingViewController

and then initialize and present it like so:-

```
        let slidingController = SlidingViewController.instance()
        let menuController = ProfileRouter.setupModule(model: nil) // example child controller
        slidingController.initWith(controller: menuController)
        slidingController.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        self.navigationController?.present(slidingController, animated: false, completion: nil)
```

![alt text](https://github.com/iThink32/SlidingMenu/blob/master/Screen%20Shot%202018-02-21%20at%2011.57.35%20AM.png)

### NOTE:-  i have fixed the container view width in sliding view controller in the storyboard you should change it according to the width of the container view you want.You must also set the same width that u set for the container view in the @IBInspectable property of the class SlidingViewController.I know this can be optimised , will do it when i get time.
