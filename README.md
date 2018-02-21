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
``
